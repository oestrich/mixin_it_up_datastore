class User
  include Mongoid::Document

  field :username, :type => String

  belongs_to :organization
  has_many :campaigns
end
