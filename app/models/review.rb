class Review < ActiveRecord::Base
  attr_accessible :score, :text
  belongs_to :landlord


  rails_admin do
    list do
      field :id
      field(:landlord)        { label "Landlord" }
      field(:score)           { label "Score" }
      field(:text)            { label "Review text" }
    end
  end

end
