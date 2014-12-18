class ImageMessageService < CoreService
  require 'service/core_service'
  
  
  def construct
    self.reply_text("这是一条图片回复")

  end
  
  

end