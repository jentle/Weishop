class EventMessageService < CoreService
  require 'service/core_service'

  
  def reply
    case @message.event
    when "subscribe"
      if @follower.nil?
        @follower = Follower.new({:name => @message.to_user_name,:public_account_id => @public_account.id })
        @follower.save
        reponse = self.construct_text("感谢您的关注")
      else
        reponse = self.construct_text("感谢您的再次关注")
      end
    end
    self.save_response(response)
    response
  end
end