class VoiceMessageService < CoreService
  
  def construct
    if !@message.recognition
      reply_text("语音识别失败，请再说一遍")
    else
      reply_text("你说的是：#{@message.recognition}" )
    end
  end
end