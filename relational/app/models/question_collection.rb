class QuestionCollection
  include Mongoid::Document

  embeds_many :questions
end
