require 'rails_helper'

RSpec.describe "reviews/new", :type => :view do
  before(:each) do
    assign(:review, Review.new(
      :text => "MyString",
      :score => ""
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_text[name=?]", "review[text]"

      assert_select "input#review_score[name=?]", "review[score]"
    end
  end
end
