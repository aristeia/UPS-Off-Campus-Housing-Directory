class AddStudentUserTable < ActiveRecord::Migration
	def change
		create_table :student_users do |t|
			t.string :provider
			t.string :uid
			t.string :name
			t.string :last_name
			t.string :first_name
			t.string :member_of
		end
	end
end
