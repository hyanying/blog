class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new

  	@user = User.new

  end	

  def index
    @user = User.all
  end
  	
  def create
  	
  	@user = User.new(user_params)

  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to '/'
  	else
  		redirect_to '/signup'	
  	end	

  end	

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end
 
private
 
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :status)
  end

end
