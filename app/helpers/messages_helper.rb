module MessagesHelper
  def parse_request request
    params = Hash.new
    request.each {|u,v|
      if u.to_s.eql? "MsgType"
        v = v.to_s.classify + "Message"
      end
      params[underscore(u.to_s)] = v
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
end
