class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def L4
    session[:c] ||= 0
    session[:c] = session[:c].to_i + 1
    render plain: session[:c]
  end
  def logout
    reset_session  # セッションを完全に削除します
    redirect_to '/top/main'  # ログイン画面にリダイレクトします
  end
end
