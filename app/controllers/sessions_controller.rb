class SessionsController < ApplicationController
  def login_form
  end

  def login
    user = User.find_by(uid: params[:uid], pass: params[:pass])
    if user
      session[:login_uid] = user.uid
      redirect_to '/', notice: 'ログインに成功しました。'
    else
      # エラーメッセージをセットしてログインフォームを再描画
      flash.now[:alert] = 'IDまたはパスワードが間違っています。'
      render 'login_form'
    end
  end

  def logout
    reset_session
    redirect_to '/sessions/login_form', notice: 'ログアウトしました。'
  end
end