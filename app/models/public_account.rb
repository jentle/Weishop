class PublicAccount < ActiveRecord::Base
  has_many :followers
  has_many :messages
end
