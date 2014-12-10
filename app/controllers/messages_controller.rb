class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_filter :check_token , only: []
  skip_before_filter :verify_authenticity_token, :only => [:create]
  helper MessagesHelper
  
  require 'service/core_service'
  require 'service/text_message_service'
  require 'service/image_message_service'
 
  # GET /messages
  # GET /messages.json
  def index
    #render :text=> params[:echostr]
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
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

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end
    
    def check_token
      array = ["gujiang", params[:timestamp], params[:nonce]].sort
      render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:to_user_name, :create_time, :msg_type, :content, :msg_id, :media_id, :pic_url, :format, :thumb_media_id)
    end
end
