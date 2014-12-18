require 'JSON'
class Menu  
  def initialize
    @menu = {:button=>[]}
  end
  
  def menu
    @menu
  end
  
  def add_button b
    if @menu[:button].count < 3
      @menu[:button].push b.button
    end
  end
end
