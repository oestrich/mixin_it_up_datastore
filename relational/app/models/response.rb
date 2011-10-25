class Response < ActiveRecord::Base
  belongs_to :survey
  has_one :campaign, :through => :survey
end
