#!/usr/bin/env python
import os
import sys
import datetime
import urllib2
import pprint
import json
from StringIO import StringIO
from BeautifulSoup import BeautifulSoup, NavigableString


def download(url, dest, line_processor=None):
    """
    Download the specified url to the destination file.
    Optionally takes a function that is called on each line of the downloaded data.
        (The function has one argument - a string - and returns a string containing
        the line that's actually written to the file)
    """
    response = urllib2.urlopen(url)
    data = response.read()

    lines = []
    line = []
    for chunk in data:
        line.append(chunk)
        if "\n" in chunk:
            lines.append("".join(line))
            line = []

    fp = open(dest, 'w')
    for line in lines:
        if line_processor is not None:
            line = line_processor(line)
        fp.write(line)

    fp.close()



def clean(txt):
    """
    Cleans strings from an HTML file
    """
    if isinstance(txt, list):
        data = u""
        for item in txt:
            if unicode(item) == u"<br />":
                continue
            else:
                data += unicode(item)
        txt = data

    txt = unicode(txt)
    if txt == u"&nbsp;":
        return u""
    while u"&nbsp;" in txt:
        txt = txt.replace(u"&nbsp;", u" ")
    while u"&amp;" in txt:
        txt = txt.replace(u"&amp;", u"&")
    return txt.strip()


def clean_citystatezip(txt):
    """
    Cleans a string from an HTML file that contains a city,state,zip and returns a 3-tuple with that data
    """
    parts = clean(txt).split(" ")
    assert(len(parts) == 3)
    city, state, zip = parts
    city = city.rstrip(",").strip()
    state = state.strip()
    zip = zip.strip()
    return (city, state, zip)


def getid(js):
    """
    Takes the stupid javascript link and returns the database id for the residence
    """
    js = js.replace("javascript:openWindow(\'och.och_res_info?", "")
    js = js.replace("','height=800,width=850,screenX=100,left=100,screenY=100,top=100,resizable,scrollbars,toolbar');", "")
    js = js.replace("&p_campus=UPS", "")
    js = js.replace("p_listing_id=", "")
    return js



class Residence(object):
    """
    All the data for a particular residence.
    The constructor takes the table row from the search page and parses everything from there
    """
    def __init__(self, row):
        cols = row.findAll("td")
        self.photos = clean(cols[0].contents[0])
        self.address = clean(cols[1].findAll("a")[0].contents[0])

        self.id = getid(cols[1].findAll("a")[0]["href"])

        addrinfo = []
        first = True
        for chunk in cols[1].contents:
            if first:
                first = False
                continue
            if unicode(chunk) != "<br />":
                addrinfo.append(chunk)

        if len(addrinfo) == 1:
            self.address2 = ""
            self.city, self.state, self.zip = clean_citystatezip(addrinfo[0])

        elif len(addrinfo) == 2:
            self.address2 = clean(addrinfo[0])
            self.city, self.state, self.zip = clean_citystatezip(addrinfo[1])

        self.type = clean(cols[2].contents[0])
        self.bed = clean(cols[3].contents[0])
        self.bath = clean(cols[4].contents[0])
        self.miles = clean(cols[5].contents[0])
        self.rent = clean(cols[6].contents[0])
        self.available = clean(cols[7].contents[0])

        #
        # pull down and parse details page
        #
        url = "http://cascade.pugetsound.edu/cascade/och.och_res_info?p_listing_id=%s" % self.id
        filename = "./cache/%s.html" % self.id

        if not os.path.exists(filename):
            print "Downloading %s.html" % self.id
            download(url, filename, lambda line: line)

        fp = open(filename, 'r')
        soup = BeautifulSoup(fp)
        fp.close()
        
        # all data is in <div id="margin"></div>
        data = soup.find(id="margin")
        tables = data.findAll("table")

        self._parse_main(tables[0])
        self._parse_pictures(tables[1])
        self._parse_details(tables[2])
        self._parse_amenities(tables[3])


    def _parse_main(self, table):
        data = {}
        for td in table.findAll("td"):
            key = None
            val = []

            if td.find("strong"):
                key = clean(td.find("strong").contents).rstrip(":").strip().lower().replace(" ", "_")

            for i in range(1, len(td.contents)):
                if isinstance(td.contents[i], NavigableString):
                    cleaned_data = clean(td.contents[i])
                    if len(cleaned_data) > 0:
                        val.append(cleaned_data)

            if key is not None:
                data[key] = val

        for key, val in data.items():
            if key != u"address":
                data[key] = clean(val)
        
        self._main = data


    def _parse_pictures(self, table):
        pass


    def _parse_details(self, table):
        data = {}

        key = None
        val = None
        for td in table.findAll("td"):

            if clean(td.contents).endswith(":"):
                key = clean(td.contents).lower().replace("(refundable)", "").rstrip(":").strip().replace(" ", "_")
            elif key is not None and val is None:
                val = clean(td.contents)

            if key is not None and val is not None:
                data[key] = val
                key = None
                val = None

        rownum = 0
        for tr in table.findAll("tr"):
            if rownum == 1:
                data[u"contact_email"] = clean(tr.findAll("td")[1].contents)
            elif rownum == 2:
                data[u"contact_phone"] = clean(tr.findAll("td")[1].contents)
            if rownum > 2:
                break

            rownum += 1

        """
        i = 0
        for td in table.findAll("td"):
            if i == 1:
                data["contact_name"] = clean(td.contents)
            elif i == 3:
                data["available"] = clean(td.contents)
            elif i == 5:
                data["contact_email"] = clean(td.contents)
            elif i == 7:
                data["notes"] = clean(td.contents)
            elif i == 9:
                data["contact_phone"] = clean(td.contents)
            elif i == 11:
                data["lease_term"] = clean(td.contents)
            elif i == 13:
                data["deposit"] = clean(td.contents)
            elif i == 15:
                data["heat_type"] = clean(td.contents)
            elif i == 17:
                data["pets_allowed"] = clean(td.contents)
            elif i == 19:
                data["furnishing"] = clean(td.contents)
            i += 1
        """

        self._details = data


    def _parse_amenities(self, table):
        self._amenities = {}

        for td in table.findAll("td"):
            key = clean(td.contents[-1]).strip().lower().replace(" ", "_")

            if td.find("img")["alt"] == "Has":
                self._amenities[key] = True
            else:
                self._amenities[key] = False


    def dict(self):
        return {
            'id': self.id,
            #'photos': self.photos,
            'address': self.address,
            'address2': self.address2,
            'city': self.city,
            'state': self.state,
            'zip': self.zip,
            'type': self.type,
            'bed': self.bed,
            'bath': self.bath,
            'miles': self.miles,
            'rent': self.rent,
            'available': self.available,
        }



def parse():
    fp = open("./cache/main.html", 'r')
    soup = BeautifulSoup(fp)
    fp.close()

    table = soup.find(id="margin").findAll("table")[0]

    residences = []

    firstRow = True
    for row in table.findAll("tr"):
        if firstRow:
            firstRow = False
            continue
        residences.append(Residence(row))

    return residences



def getdata():
    mainfile = "./cache/main.html"

    def lineproc(line):
        line = line.replace("https://cascade.pugetsound.edu/", "/")
        line = line.replace("http://", "/")
        line = line.replace("https://", "/")
        return line

    if not os.path.exists(mainfile):
        download('https://cascade.pugetsound.edu/cascade/och.och_results', mainfile, lineproc)

    return parse()


def export_to_json(filename):
    """
    Exports data to a json file
    """
    print "Pulling and parsing input data..."

    residences = []
    landlords = {}

    for resdata in getdata():
        base = resdata.dict()

        print "Importing: %s" % base["address"]

        res = {}
        res['address'] = base["address"]
        res['address2'] = base["address2"]
        res['city'] = base["city"]
        res['state'] = base["state"]
        res['zipcode'] = base["zip"]

        res['restype'] = base["type"]

        bedrooms = resdata._main[u"bedrooms"].replace("available", "").strip()
        parts = bedrooms.split(" of ")
        if len(parts) == 1:
            res['bedrooms_available'] = int(parts[0])
            res['bedrooms_total'] = int(parts[0])
        elif len(parts) == 2:
            res['bedrooms_available'] = int(parts[0])
            res['bedrooms_total'] = int(parts[1])

        res['bathrooms'] = resdata._main[u"bathrooms"]
        res['miles_from_campus'] = resdata._main[u"miles_from_ups"]
        res['total_monthly_rent'] = resdata._main[u"total_monthly_rent"].replace("$", "").strip()
        #res.arrangement

        landlord_key = resdata._details[u"contact"]
        if not landlords.has_key(landlord_key):
            landlords[landlord_key] = {
                'name': resdata._details[u"contact"],
                'email': resdata._details[u"contact_email"],
                'phone1': resdata._details[u"contact_phone"],
            }

        res['contact'] = landlord_key

        if resdata._details.has_key(u"description"):
            res['description'] = resdata._details[u"description"]
        else:
            res['description'] = ""

        if resdata._details.has_key(u"notes"):
            res['notes'] = resdata._details[u"notes"]
        else:
            res['notes'] = ""

        if resdata._details.has_key(u"furnishing"):
            res['furnishing'] = resdata._details[u"furnishing"]
        else:
            res['furnishing'] = ""

        if resdata._details.has_key(u"parking"):
            res['parking'] = resdata._details["parking"]
        else:
            res['parking'] = ""

        availdate = resdata._details[u"available"]
        if " " in availdate:
            parts = availdate.split(" ")
            availdate = parts[0]

        month, day, year = availdate.split("/")
        month = int(month)
        day = int(day)
        year = int(year)
        if year < 2000:
            year = year + 2000
        res['available'] = [year, month, day] #datetime.date(year, month, day)

        res['lease_term'] = resdata._details["lease_term"]

        if resdata._details.has_key("security_deposit"):
            res['security_deposit'] = resdata._details["security_deposit"].replace("$", "").strip()
            res['security_deposit_refundable'] = resdata._details["security_deposit"].replace("$", "").strip()
        else:
            res['security_deposit'] = ""
            res['security_deposit_refundable'] = ""
        
        if resdata._details.has_key('heating_type'):
            res['heating_type'] = resdata._details["heating_type"]
        else:
            res['heating_type'] = ""

        res['am_laundry'] = resdata._amenities['laundry']
        res['am_coin_op_laundry'] = resdata._amenities['coin-operated_laundry']
        res['am_extra_storage'] = resdata._amenities['extra_storage']
        res['am_cable_tv'] = resdata._amenities['cable_tv_included']
        res['am_smoking_allowed'] = resdata._amenities['smoking_allowed']
        res['am_smoke_detector'] = resdata._amenities['smoke_detector']
        res['am_ada_accessible'] = resdata._amenities['ada_accessible']
        res['am_internet_included'] = resdata._amenities['internet_included']
        res['am_stove'] = resdata._amenities['stove']
        res['am_refrigerator'] = resdata._amenities['refrigerator']
        res['am_dishwasher'] = resdata._amenities['dishwasher']
        res['am_lawn_care_included'] = resdata._amenities['lawn_care_included']
        res['am_water_included'] = resdata._amenities['water_included']
        res['am_sewer_included'] = resdata._amenities['sewer_included']
        res['am_garbage_included'] = resdata._amenities['garbage_included']
        res['am_electricity_included'] = resdata._amenities['electricity_included']

        residences.append(res)

    #io = StringIO()
    io = open(filename, 'w')
    json.dump({
        'residences': residences,
        'landlords': landlords,
    }, io, indent=4, sort_keys=True)
    io.close()



if __name__ == "__main__":

    if len(sys.argv) == 2:
        export_to_json(sys.argv[1])
    else:
        print "not enough arguments (expected export filename)"

    """
    res = getdata()
    fp = open("output.txt", 'w')
    fp.write("=============================================================\n\n")
    for r in res:
        for key, val in r.dict().items():
            fp.write("%s: %s\n" % (key, val))
        fp.write("\n")
        for key, val in r._main.items():
            fp.write("%s: %s\n" % (key, val))
        fp.write("\n")
        for key, val in r._details.items():
            fp.write("%s: %s\n" % (key, val))
        fp.write("\n")
        for key, val in r._amenities.items():
            fp.write("%s: %s\n" % (key, val))
        fp.write("=============================================================\n\n")
    fp.close()
    """

    """
    res = getdata()
    for r in res:
        if r.id == "1054":
            pp = pprint.PrettyPrinter(indent=1, width=80)
            pp.pprint(r.dict())
            print
            pp.pprint(r._main)
            print
            pp.pprint(r._details)
            print
            pp.pprint(r._amenities)
            break
    """

