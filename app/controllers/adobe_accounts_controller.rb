class AdobeAccountsController < ApplicationController
  def index
  	@adobe_accounts = AdobeAccount.all.order("email ASC")
  end

  def new
  	@adobe_account = AdobeAccount.new
  end

  def create
  	@adobe_account = AdobeAccount.new(adobe_account_params)
    respond_to do |format|
      if @adobe_account.save
        format.html { redirect_to @adobe_account, notice: 'Computer was successfully created.' }
        format.json { render action: 'index', status: :created, location: @adobe_account }
      else
        format.html { render action: 'new' }
        format.json { render json: @adobe_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @adobe_account = AdobeAccount.find(params[:id])


    @computers = AdobeAccount.find(params[:id]).computer
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def adobe_account_params
      params.require(:adobe_account).permit(:email)
    end

end
