class AdminController < ApplicationController
   skip_before_filter :verify_authenticity_token, :only => [:parse]
  def parse
    
  end
end
