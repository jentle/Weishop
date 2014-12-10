class ImageMessageService < CoreService
  require 'service/core_service'
  
  
  def reply
    response = self.construct_text("这是一条图片回复")
    response.save
    response
  end
  
  

end