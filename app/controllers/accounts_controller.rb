class AccountsController < ApplicationController
  def index
    @accounts = Account.page(params[:page]).per(10)
  end

  def show
    @account = Account.find(params[:id])
  end
end
