class TextMessageService < CoreService
  require 'service/core_service'
  

  def construct
    status = analysis @message.content
    auto_reply status
  end
  
  
  
end