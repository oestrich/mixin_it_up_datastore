class Organization
  include Mongoid::Document

  field :name, :type => String

  has_many :campaigns
  has_many :users
end
