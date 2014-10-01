class UserInfoController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @userinfo = current_user.userinfo.build(userinfo_params)
    if @userinfo.save
      flash [:success] = "Datos Guardados"
      redirect_to root_url
    else
      render ''
    end
  end
  def destroy
  end
  private
     def userinfo_params
       params.require(:userinfo).permit(:name, :adress, :tel)
     end
end
