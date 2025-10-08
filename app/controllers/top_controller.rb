class TopController < ApplicationController
  def main
    if session[:login_uid]
      render 'main'
    else
      render 'login_form'
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && user.pass == params[:pass]
      session[:login_uid] = user.uid
      redirect_to '/'
    else
      render 'error', status: 422
    end
  end

  def logout
    reset_session
    redirect_to '/top/main'
  end
end