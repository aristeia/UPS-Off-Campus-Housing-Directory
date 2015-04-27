class AddEmailToStudentUser < ActiveRecord::Migration
  def change
  	add_column :student_users, :email, :string
  end
end
