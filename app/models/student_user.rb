class StudentUser < ActiveRecord::Base
	attr_protected :uid, :provider #for omniauth authentication
	attr_accessible :name, :email, :last_name, :first_name, :member_of #ups data fields

	def full_name
		first_name + " " + last_name
	end

	# is a faculty member?
	def faculty?
		member_of.downcase.include? "faculty"
	end

	# is a student?
	def student?
		member_of.downcase.include? "student"
	end

	#is a landlord?
	def landlord?
		member_of.downclase.include? "landlord"
	end

	# creates a new user from the given omniauth authorization
	def self.create_with_omniauth(auth)
	user = StudentUser.new(
		:name => auth["info"]["name"],
			:email => auth["info"]["email"],
			:last_name => auth["info"]["last_name"],
			:first_name => auth["info"]["first_name"],
			:member_of => auth["info"]["memberOf"],
		)
		user.provider = auth["provider"]
		user.uid = auth["uid"]
		user.save!
		return user
	end
end
