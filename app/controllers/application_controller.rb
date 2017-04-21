class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_action :append_view_paths

  private

  def append_view_paths
    append_view_path "app/views/application"
  end

  def after_sign_out_path_for(resource)
    return new_user_session_url
  end
end
