class Message < ActiveRecord::Base
  belongs_to :public_account
  belongs_to :follower
  
  self.inheritance_column = :msg_type
  
  def to_str
    "this is a base message"
  end
  
  def default_response
    "this is a default message"
  end
end
