class Follower < ActiveRecord::Base
  has_many :messages
  belongs_to :public_account
  has_one :user_info
  
  def user_info 
  end
  
end
