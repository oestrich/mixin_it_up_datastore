class Survey < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
  has_many :responses
end
