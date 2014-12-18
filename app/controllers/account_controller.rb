class AccountController < ApplicationController
  def index
    @public_accounts = PublicAccount.all
  end

  def show
  end
  
  def edit
    
  end

  def update
  end

  def destroy
  end
end
