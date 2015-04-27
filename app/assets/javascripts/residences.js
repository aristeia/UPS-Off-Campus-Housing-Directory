var prevResidence = undefined;
var collapsed = false;

$(function() {

	$("#results_table").tablesorter();

	$("#map_button_bar").slideUp(0);
	$("#login_bar").slideUp(0);
	$("#login_select").slideUp(0);

	if(window.location.hash) {
		var incomingID = window.location.hash.substring(1);
		showResidence(incomingID, residences_path + "/" + incomingID, 0);
	}

	$("#login_link").click(function() {
		$("#login_select").slideDown();
	});

	$("#landlord_button").click(function() {
		$("#login_bar").slideDown();
	});

	$("#ups_button").click(function() {
		window.location.replace("/auth/shibboleth");
	});
});

function close_hint() {
	$("#map_hint").fadeOut(250);
}

function showResidence(id, path, speed) {
	close_hint();
	if(!collapsed) {
		if(speed == undefined)
			speed = 500;
		$("#residence_detail_container").fadeOut(0);
		collapse(speed);
		loadPathIntoContainer(path);
	} else {
		loadPathIntoContainer(path);
	}

	if(prevResidence)
		$("#residence_" + prevResidence).removeClass("highlight");
	prevResidence = id;

	$("#residence_" + id).addClass("highlight");

	location.hash = id;

}

function loadPathIntoContainer(path) {
	$.get(path + ".ajax", function(data) {
		$('#residence_detail_container').html($(data).html());
		$("#residence_detail_container").delay(500).fadeIn(200);
		Shadowbox.setup();
	});
}

function collapse(speed) {

	$(".collapsible").animate({width: "0px"}, 500, function() {
		$(".collapsible").hide();
	});
	$("#results_container").removeClass("sixteen");
	$("#results_container").addClass("four");

	$("#results_table").removeClass("striped");
	$("#map").slideUp(speed);
	$("#map_button_bar").slideDown();
	collapsed = true;
}

function showMap() {

	$(".collapsible").show();
	$(".collapsible").css({width: "auto"});

	$("#results_container").removeClass("four");
	$("#results_container").addClass("sixteen");

	$("#results_table").addClass("striped");
	$("#results_table tr").removeClass("highlight");
	$("#map").slideDown(500);
	$("#map_button_bar").slideUp();
	collapsed = false;

	$("#residence_detail_container").html("");
}