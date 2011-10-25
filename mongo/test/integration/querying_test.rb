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
    # I want to find all complete responses from all of their campaigns
    surveys = Survey.where(:campaign_id.in => @user.campaigns.map(&:id))

    responses = Response.where(:survey_id.in => surveys.map(&:id), :complete => true)

    assert_equal [@complete_response], responses.to_a

    # Add response belongs_to user (survey_creator)
    responses = Response.where(:survey_creator_id => @user.id, :complete => true)
    assert_equal [@complete_response], responses.to_a
  end
end
