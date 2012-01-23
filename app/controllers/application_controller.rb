class ApplicationController < ActionController::Base
  include Clearance::Authentication
  before_filter :set_locale_from_url
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  def set_locale_from_url
    I18n.locale = params[:i18n_locale].presence || I18n.default_locale
  end
end
