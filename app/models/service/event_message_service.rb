class EventMessageService < CoreService
  require 'service/core_service'

  
  def construct
    case @message.event
    when "subscribe"
      reply_subscribe
    when "unsubscribe"
      #self.reply_text("再见")
    when "ENTER"
      reply_text("有什么我可以帮你的吗？")
    when "CLICK"
      reply_click
    when "LOCATION"
    else 
      reply_text("你好")
    end
    @follower.save
  end
  
  def reply_subscribe
  
    if @follower.subscribe == 0
      @follower.subscribe = 1
      
      reply_text("欢迎来到微信小店。我是智能店小二，回复数字获得相应服务。 \n ［1］热卖推荐 \n ［2］订单及物流查询 \n ［3］更多内容正在建设中 \n 回复关键词搜索本店商品")
    else
      @follower.subscribe  += 1
      reply_text("感谢您的再次关注.我是智能店小二，回复数字获得相应服务。 \n ［1］热卖推荐 \n ［2］订单及物流查询 \n ［3］更多内容正在建设中 \n 回复关键词搜索本店商品")
    end     
  end
  
  def reply_click
    case @message.event_key
    when "WS_CUSTM"
      #CALL CUSTOM SERVICE
      @public_account.transfer_service @follower.openid
      #transfer_service
      #reply_transfer( service_id )
    when "WS_RECO"
      recommendation
    when "WS_CART"
      shopping_cart
    else
    end
  end
  

  
  
end