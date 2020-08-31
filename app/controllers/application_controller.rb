class ApplicationController < ActionController::Base
  # before_action :authenticate_user!,except: [:index, :show] #ログインしていない場合サインアップの画面に遷移する
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

    #passwordとemailはデフォルトであるので不要
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name])
  end

end
