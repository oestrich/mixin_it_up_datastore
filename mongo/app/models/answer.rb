class Answer
  include Mongoid::Document

  field :question, :type => String
  field :answer, :type => String
  field :field_type, :type => String

  embedded_in :response
end
