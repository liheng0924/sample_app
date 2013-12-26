class UsersController < ApplicationController
  def new
   @user=User.new
  end
  
  
   def show
   @user=User.find(params[:id])
   #@user=User.find_by_name("henry")       'success
   #@user=User.find_by_id(params[:id])     'users/1
   #@user=User.find_by_name(params[:id])   'users/henry
  end
 

  def create
   @user = User.new(user_params)
   # Not the final implementation!
   if @user.save
    # Handle a successful save.
    redirect_to @user
    flash[:success] = "Welcome to the Sample App!"
   else
    render 'new'
   end
  end

 
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

  
end