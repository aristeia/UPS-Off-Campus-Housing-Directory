class AddAuthToUser < ActiveRecord::Migration
	def change
		add_column :users, :provider, :string
		add_column :users, :uid, :string
		add_column :users, :name, :string #ups id
		add_column :users, :last_name, :string
		add_column :users, :first_name, :string
		add_column :users, :member_of, :string #membership (e.g., faculty or student)
	end
end
