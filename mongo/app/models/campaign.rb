class Campaign
  include Mongoid::Document

  field :name, :type => String

  belongs_to :user
  has_many :surveys

  delegate :organization, :to => :user
end
