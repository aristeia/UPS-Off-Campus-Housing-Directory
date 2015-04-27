class User < ActiveRecord::Base
  attr_protected :uid, :provider #for omniauth authentication
  attr_accessible :name, :email, :last_name, :first_name, :member_of, :landlord_id, :password_confirmation #ups data fields

   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

  belongs_to :landlord

  # Setup accessible (or protected) attributes for your model
  validates :email, :email => true #see https://github.com/balexand/email_validator/blob/master/spec/email_validator_spec.rb
  attr_accessible :password, :remember_me #,:password_confirmation

  def member_of_enum
    ["landlord", "admin"]
  end

  before_validation :check_group

  def check_group
    # return false and don't save if the member_of field is set incorrectly
    member_of_enum.include? self.member_of
  end
  
  rails_admin do
    list do
      field(:email)           { label "Email" }
      field(:last_name)       { label "Last name" }
      field(:first_name)      { label "First name" }
      field(:sign_in_count)   { label "Sign-in count" }
      field(:last_sign_in_at) { label "Last sign-in" }
      field(:member_of)       { label "Member of" }
    end
  end

end
