class WeixinAPI
  require 'net/http'
  require 'json'
  
  def self.check_access_token public_account
    url = URI("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{public_account.app_id}&secret=#{pubic_account.app_secret}")
    if public_account.access_token.nil? 
      resp = Net::HTTP.get(url)
      hash = JSON.parse(resp)
      public_account.accesstoken =  hash[:access_token]
      public_account.save
    end
  end
end