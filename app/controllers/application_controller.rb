class ApplicationController < ActionController::Base
  before_action :set_locale
  add_breadcrumb "Homepage", :root_path

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
