class PublicAccount < ActiveRecord::Base
  has_many :followers
  has_many :messages
  
  def check_access_token 
    uri = URI("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{self.app_id}&secret=#{self.app_secret}")
    if self.access_token_expired? 
      resp = Net::HTTP.get(uri)
      hash = JSON.parse(resp)
      if hash["errcode"]
        handle_error hash
      else
        self.access_token = hash["access_token"]
        self.expired_at = Time.now.to_i + hash["expires_in"]
        save
      end
    end
  end
  
  def access_token_expired?
    if !self.access_token
      true
    else
      Time.now.to_i > self.expired_at
    end
  end
  
  def create_follower  open_id
    check_access_token
    
    uri = URI("https://api.weixin.qq.com/cgi-bin/user/info?access_token=#{self.access_token}&openid=#{open_id}&lang=zh_CN")
    resp = Net::HTTP.get(uri)
    hash = JSON.parse(resp)
    follower = self.followers.create(hash)
    follower.save
    follower
  end
  
  def download_media media_id
    check_access_token
    uri = URI("http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=#{self.access_token}&media_id=#{media_id}")
  end
  
  def transfer_service open_id
    send_text_message( open_id , "客服： 江 为您服务")
    
  end
  
  def send_text_message (open_id, content)
    check_access_token
    uri = URI("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=#{self.access_token}")
    json_param = {:touser=> open_id, :msgtype=> 'text', :text=>{:content=> content}}.to_json
    post_request(uri,json_param)
  end
  
  def create_menu menu
    check_access_token
    uri= URI("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=#{self.access_token}")
    
    post_request(uri,menu.to_json)
    
  end
  
  def post_request(uri, param)
    req = Net::HTTP::Post.new uri
    req["Content-Type"] ="application/json"
    req["Accept"] = "application/json"
    req.body = param
    con = Net::HTTP.new(uri.host, uri.port)
    # ssl for https
    con.use_ssl = true
    con.verify_mode = OpenSSL::SSL::VERIFY_NONE
    resp = con.start {|http| http.request(req) }
    hash = JSON.parse(resp.body) 
    if hash["errcode"] > 0
      #handle_error hash
      puts hash["errmsg"]
    end
  end
  
  
  def handle_error error   
    case error["errcode"]
    when 40001
    when 40002
    when 40003
    when 40004
    when 40005
    when 40006
    when 40007
    when 40008
    when 40009
    when 40010
    when 40011
    when 40012
    when 40013
    when 40014
    when 40015
    when 40016
    when 40017
    when 40018
    when 40019
    when 40020
    when 40021
    when 40022
    when 40023
    when 40024
    when 40025
    when 40026
    when 40027
    when 40028
    when 40029
    when 40030
    when 40031
    when 40032
    when 40033
    when 40034
    when 40035
    when 40036
    when 40037
    when 40038
    when 40039
    when 40050
    when 40051
    when 41001
    when 41002
    when 41003
    when 41003
    when 41004
    when 41005
    when 41006
    when 41007
    when 41008
    when 41008
    when 42001
    when 42002
    when 42003
    when 43001
    when 43002
    when 43003
    when 43004
    when 43005
    when 44001
    when 44002
    when 44003
    when 44004
    when 45001
    when 45002
    when 45003
    when 45004
    when 45005
    when 45006
    when 45007
    when 45008
    when 45009
    when 45010
    when 45015
    when 45016
    when 45017
    when 45018
    when 46001
    when 46002
    when 46003
    when 46004
    when 47001
    when 48001
    when 50001
    else
    end 
  end
end
