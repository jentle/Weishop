class MenuButton
  def initialize (type, name,key)
    @button = Hash.new
    @button[:type] = type
    @button[:name] = name 
    if type.eql? "view"
      @button[:url]= key
    else
      @button[:key] = key
    end
     @button[:sub_button] = []
  end
  
  def button
    @button
  end
  
  
  def add_sub b
    if @button[:sub_button].count < 5
      @button[:sub_button].push b.button
    end
  end
end