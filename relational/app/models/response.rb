class Response < ActiveRecord::Base
  belongs_to :survey
  has_one :campaign, :through => :survey

  before_create :create_answer_collection

  def answer_collection
    AnswerCollection.find(self.bson_id)
  end

  private
  def create_answer_collection
    self.bson_id = AnswerCollection.create.id
  end
end
