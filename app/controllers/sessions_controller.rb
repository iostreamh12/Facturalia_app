class SessionsController < ApplicationController
  def destroy
    sign_out
    redirect_to new_user_session_path
  end
end
