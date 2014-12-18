class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
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
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:to_user_name, :create_time, :msg_type, :content, :msg_id, :media_id, :pic_url, :format, :thumb_media_id,:even_key)
    end
end
