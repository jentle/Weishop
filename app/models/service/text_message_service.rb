class TextMessageService < CoreService
  require 'service/core_service'
  

  
  def reply
    response = self.construct_text("这是一条文本")
    self.save_response(response)
    response
  end
end