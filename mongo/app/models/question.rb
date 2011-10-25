class Question
  include Mongoid::Document

  field :question, :type => String
  field :field_type, :type => String

  embedded_in :survey
end
