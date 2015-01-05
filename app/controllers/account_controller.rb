class AccountController < ApplicationController
  before_action :set_account , only: [:show, :edit, :update, :destroy]
  def index
    @public_accounts = PublicAccount.all
  end

  def show
  end
  
  def edit
    
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = PublicAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:public_account).permit(:name, :app_id, :app_secret, :official_name)
    end
end
