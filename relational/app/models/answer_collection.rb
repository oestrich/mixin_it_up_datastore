class AnswerCollection
  include Mongoid::Document

  embeds_many :answers
end
