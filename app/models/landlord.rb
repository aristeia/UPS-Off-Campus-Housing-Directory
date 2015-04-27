class Landlord < ActiveRecord::Base
    has_many :residences, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :finances, dependent: :destroy
    attr_accessible :name, :email, :phone1, :phone2
    has_one :user

    rails_admin do
        list do
            field :id
            field :name
            field :email
            field :phone1
            field :phone2
        end
    end
 
end
