class AccountsController < ApplicationController
	
	private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      accessible = [ :user_id, :oauth_expires, :oauth_token, :provider, :uid, :username, :oauth_secret ]
      params.require(:user).permit(accessible)
    end
end
