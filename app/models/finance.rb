class Finance < ActiveRecord::Base
  attr_accessible :amount, :datepaid, :landlord_id

  belongs_to :landlord

  rails_admin do
    list do
      field :id
      field(:landlord)       { label "Landlord" }
      field(:amount)         { label "Amount Paid" }
      field(:datepaid)       { label "Date Paid" }
    end
  end

end
