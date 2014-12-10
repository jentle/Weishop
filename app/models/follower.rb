class Follower < ActiveRecord::Base
  has_many :messages
  belongs_to :public_account
end
