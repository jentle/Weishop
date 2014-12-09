class Message < ActiveRecord::Base
  self.inheritance_column = :msg_type
  
  def to_str
    "this is a base message"
  end
end
