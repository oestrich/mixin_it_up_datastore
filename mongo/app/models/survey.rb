class Survey
  include Mongoid::Document

  field :name, :type => String

  belongs_to :campaign
  belongs_to :user
  has_many :responses
  embeds_many :questions
end
