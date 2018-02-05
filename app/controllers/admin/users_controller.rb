class Admin::UsersController < Admin::BaseAdminController
	def index
    	@users = User.all
    	@users = @users.order(:updated_at).reverse_order.page(params[:page]).per(15) 
  	end

  	def new
      @user = User.new
    end

  	def edit
      @user  = User.find(params[:id])
      @role = @user.role
    end

    def update
      @user  = User.find(params[:id])

      if @user.update_attributes(user_params)
        redirect_to admin_users_path, notice: "Updated successfully!"

      else
        flash[:error] = @user.errors.full_messages.to_sentence
        redirect_to admin_users_path
      end
    end

    def destroy
	    @user  = User.find(params[:id])
	    @user.destroy
	    redirect_to admin_users_path, notice: "#{@user.firstName} was deleted successfully!"
	end

	protected

  def user_params
    params.require(:user).permit(:email, :firstName, :lastName, :password, :password_confirmation, :role, :phoneNo)
  end
end