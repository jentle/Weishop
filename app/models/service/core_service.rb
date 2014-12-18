class CoreService
  
  RECO = 1
  CART = 2
  WELCOME = 0
  def initialize message
    @message = message
    # response message content
   
    @public_account = PublicAccount.find_by_name(@message.to_user_name)
    if @public_account.nil?
      @public_account = PublicAccount.new({:name => @message.to_user_name})
      @public_account.save
    end
    
    @follower= Follower.find_by_openid(@message.from_user_name)
    if @follower.nil?
      @follower= @public_account.create_follower @message.from_user_name
      #@follower = Follower.new({:name => @message.from_user_name,:public_account_id => @public_account.id ,:subscribes=> 0,:followed=>true})
      #@follower.save
    end
       
    response_content= Hash.new()
    response_content[:from_user_name] = @public_account.name
    response_content[:to_user_name] = @follower.openid
    response_content[:create_time] = Time.now.to_i
    @response =  Message.new(response_content)
    self.save_message
  end
  
  def reply
    self.construct    
   
    self.save_response  
    # Be Careful , Return The Class of Its Type
    Message.find(@response.id)
  end
  
  def save_message     
    @message.follower_id = @follower.id
    @message.public_account_id = @public_account.id
    if !@message.save
      self.reply_error "保存信息错误，请重发"
    end
    
  end
  
  def save_response 
    @response.follower_id = @follower.id
    @response.public_account_id = @public_account.id
    if !@response.save
      self.reply_error "保存回复错误，请重发"
    end
  end
  
  def construct
    @response = self.reply_text("默认回复")
  end
  
  def analysis content
     if /^\d?$/.match(content) 
       content.to_i
     else 
       WELCOME
     end
  end
  
  def auto_reply status
    case status
    when RECO
      recommendation
    when CART 
      shopping_cart
    when WELCOME
      welcome
    else
      reply_text("更多内容，暂未开放")
    end
  end
  
  def welcome
    reply_text("你好，我是智能店小二，很高兴为您服务。回复数字获得相应服务。 \n ［1］热卖推荐 \n ［2］订单及物流查询 \n ［3］更多内容正在建设中。 \n 回复关键词搜索本店商品")
  end
  
  def reply_text (content)
    @response.msg_type = "TextMessage"
    @response.content = content
  end
  
  def reply_image media_id
    @response.msg_type = "ImageMessage"
    @response.media_id = media_id
  end
  
  def reply_voice media_id
    @response.msg_type = "VoiceMessage"
    @response.media_id = media_id
  end
  
  def reply_transfer service_id
    @response.msg_type="TransferCustomerService"
    @response.content = service_id
  end
  
  def query_order
    
  end
  
  def recommendation
    reply_news
    
    add_article_item("新品上市.\n本店正在筹建中，敬请期待",nil,"https://furniplanet.com/data/modern20.jpg",nil)
    add_article_item("当季热销",nil,"http://theboingy.com/media/news/44-Faro-Oak-Bedroom-Package_3858.jpg",nil)
    add_article_item("掌柜推荐",nil,"http://cdn.home-designing.com/wp-content/uploads/2012/05/pink-bedroom-design.jpg",nil)
  end
  
  def shopping_cart
    reply_news
    add_article_item("购物车","您的购物车还是空的，快来挑挑看吧","http://www.quotewerks.com/images/FeatureImages/QVcartTrans.png",nil)
  end
  
  def reply_news 
    @response.msg_type = "NewsMessage"
    # We Want The Response Is A NewsMessage Class
    @response.save
    @response = Message.find(@response.id)
  end
  
  def add_article_item (title, description,pic_url , url )
    # Add Up To 10 For Each News Message
    if @response.article_items.count < 10 
      @response.article_items.create({:title=>title,:description=>description, :pic_url=> pic_url, :url => url }).save
    else
      puts "Add Up To Max Items"
    end
  end
  
  def add_auth2_request
    
    #self.add_article_item("OAuth2.0授权"，"点击查看授权"，nil, nil )
  end
  
  def reply_error content
    self.reply_text(content)
  end
end