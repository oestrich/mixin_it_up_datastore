class Response
  include Mongoid::Document

  field :complete, :type => Boolean

  belongs_to :survey
  belongs_to :survey_creator, :class_name => "User"
  embeds_many :answers

  before_create :update_survey_creator

  private
  def update_survey_creator
    self.survey_creator = survey.campaign.user
  end
end
