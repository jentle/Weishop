class WeixinController < ApplicationController
  before_filter :check_token , only: [:index]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  require 'service/core_service'
  require 'service/text_message_service'
  require 'service/image_message_service'
 
  def index
    render :text => params[:echostr]
  end
  
  def create
    request_params = parse_request(params[:xml])
    #follower = Follower.find_by_name(request_params[:to_user_name])
    #@message = Follower.create_message(request_params)
    @message = Message.new(request_params)
    service_name = (@message.msg_type+"Service")
    service =  service_name.classify.constantize.new(@message)
    
    service.save_message
    @response = service.reply

    respond_to do |format|
      format.xml { render underscore( @response.msg_type) }
    end
   
  end
  
  # Should Be Moved To MessageHelper Later
  def parse_request request
    params = Hash.new
    request.each {|u,v|
      if !u.to_s.eql? "URL"
         if u.to_s.eql? "MsgType"
            v = v.to_s.classify + "Message"
         end
         params[underscore(u.to_s)] = v
      end
    }
   params
  end

  def underscore camel_case_word
      camel_case_word.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
  
  private
  def check_token
    array = ["gujiang", params[:timestamp], params[:nonce]].sort
    render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end
end
