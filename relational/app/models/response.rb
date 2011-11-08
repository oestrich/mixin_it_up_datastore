class Response < ActiveRecord::Base
  include Mongoid::ActiveRecordBridge

  belongs_to :survey
  has_one :campaign, :through => :survey

  attach_mongoid_document :answer_collection, :create => true
end
