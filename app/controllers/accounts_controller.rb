class AccountsController < ApplicationController
  
  load_and_authorize_resource param_method: :account_params
  def new
    #@account = Account.new
  end
  
  def create
    #@account = Account.new(account_params)
    build_resource(account_params)
    resource.save
  end
  
  def index
    @accounts = Account.all
  end
  
  def show
    @account = Account.find(params[:id])
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to @account, notice: 'User Succesfully added'
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to centre_path
  end
  
  def login=(login)
    @login = login
  end
  
  def login
    @login || self.mobile || self.email
  end
  
  protected
  def account_params
    params.require(:account).permit(:login,:mobile,:email,:password,:password_confirmation)
  end
  
end
