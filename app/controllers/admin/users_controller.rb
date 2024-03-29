class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [
    :new,
    :create,
    :show,
    :edit,
    :update,
    :destroy,
  ]
  

  def index
    @users = User.search_and_order(params[:search], params[:page])
  end
  def new
    @user = User.new
  end

  
  def show
    redirect_to edit_admin_user_path(params[:id])
  end
  
  def edit
  end
  
  def update
    old_email = @user.email
    new_params = user_params.dup
    new_params[:email] = new_params[:email].strip
    @user.name = new_params[:name]
    @user.email = new_params[:email]
    @user.password = new_params[:password] if new_params[:password].strip.length > 0
    @user.password_confirmation = new_params[:password_confirmation] if new_params[:password_confirmation].strip.length > 0
    
    if current_user.id != @user.id
      @user.admin = new_params[:admin]=="0" ? false : true
      @user.locked = new_params[:locked]=="0" ? false : true
    end
    
    if @user.valid?
      @user.skip_reconfirmation!
      @user.save
      redirect_to admin_users_path, notice: "#{@user.email} actualizado."
    else
      flash[:alert] = "#{old_email} No se actualizó."
      render :edit
    end
  end
 
  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path, notice: "#{@user.email} borrado."
  end 
  
  private 
  
  def set_user
    @user = User.find(params[:id])
  rescue
    flash[:alert] = "ID de usuario #{params[:id]} no existe."
    redirect_to admin_users_path
  end
  
  def user_params
    params.require(:user).permit(
    :name,
    :email,
    :password,
    :password_confirmation,
    :admin,
    :locked
    )
  end
  
end
