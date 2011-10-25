require 'test_helper'

class QueryingTest < ActionDispatch::IntegrationTest
  setup do
    organization = Organization.create(:name => "Apple")

    @user = User.create(:username => "iVes", :organization => organization)
    campaign1 = @user.campaigns.create(:name => "Lunch Meeting Restaurant Surveys")
    campaign2 = @user.campaigns.create(:name => "Customer Satisfaction Surveys")

    survey1 = campaign1.surveys.create(:name => "Wednesday Lunch")
    # preexisting incomplete response
    survey1.responses.create(:complete => false)

    # Here is a user completing their response
    @complete_response = survey1.responses.create(:complete => true)
  end

  test "get_user_responses" do
    responses = Response.joins(:survey, :campaign).where('complete' => true, "campaigns.user_id" => @user.id)
    assert_equal [@complete_response], responses
  end

  test "operating on the answer collection" do
    answer_collection = @complete_response.answer_collection

    # answer_collection is a Mongoid document!!!
    answer_collection.answers.create(:value => "I would like to go to McDonald's")

    assert_equal @complete_response.answer_collection, AnswerCollection.find(@complete_response.bson_id)
  end
end
