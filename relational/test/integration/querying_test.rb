require 'test_helper'

class QueryingTest < ActionDispatch::IntegrationTest
  setup do
    organization = Organization.create(:name => "Apple")

    @user = User.create(:username => "iVes", :organization => organization)
    campaign1 = @user.campaigns.create(:name => "Lunch Meeting Restaurant Surveys")
    campaign2 = @user.campaigns.create(:name => "Customer Satisfaction Surveys")

    survey1 = campaign1.surveys.create(:name => "Wednesday Lunch")

    @complete_response = survey1.responses.create(:complete => true)
    survey1.responses.create(:complete => false)
  end

  test "get_user_responses" do
    responses = Response.joins(:survey, :campaign).where('complete' => true, "campaigns.user_id" => @user.id)
    assert_equal [@complete_response], responses
  end
end
