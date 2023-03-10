class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  #↑ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしても、ログイン画面へリダイレクトする
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end


  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end