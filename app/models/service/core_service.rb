class CoreService
  
  def initialize message
    @message = message
    # response message content
   
    @public_account = PublicAccount.find_by_name(@message.to_user_name)
    if @public_account.nil?
      @public_account = PublicAccount.new({:name => @message.to_user_name})
      @public_account.save
    end
    
    @follower= Follower.find_by_name(@message.from_user_name)
    if @follower.nil?
      @follower = Follower.new({:name => @message.to_user_name,:public_account_id => @public_account.id })
      @follower.save
    end
    
    @response_content= Hash.new()
    @response_content[:from_user_name] = @public_account.name
    @response_content[:to_user_name] = @follower.name
    @response_content[:create_time] = Time.now.to_i
  end
  
  def reply
    response=self.construct_text("默认回复")
    self.save_response( response)
    response
  end
  
  def save_message     
    @message.follower_id = @follower.id
    if !@message.save
      self.reply_error
    end
    
  end
  
  def save_response response
    response.public_account_id = @public_account.id
    if !response.save
      self.reply_error
    end
  end
  
  def construct_text (content)
    @response_content[:msg_type] = "TextMessage"
    @response_content[:content] = content
    text = TextMessage.new(@response_content)
  end
  
  def construct_image()
    
  end
  
  def construct_voice
    
  end
  
  def reply_error
    @response_content[:content] = "服务器错误，请重发"
  end
end