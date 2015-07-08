class UsersController < ApplicationController
protect_from_forgery 
require 'json'

def index
@users = User.all
end
 
 def new
    @user = User.new
  end
  
  
def create
@user = User.new(user_params)

     respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Request was successfully created.' }
        format.json { render json: @user, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end 

def show

end
private

  def user_params
    params.require(:user).permit(:name, :email, :password, :cellphone, :idNumber)
  end
  
end
