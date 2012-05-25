# See https://groups.google.com/group/activeadmin/browse_thread/thread/52f9f73dfad9be9f
ActiveAdmin::Application.class_eval do 
  alias :load_method :load!
  
  def load!
    instance = self # needed for access via closure
    ActiveSupport.on_load(:after_initialize) do
      instance.load_method
    end
  end
end

module HelpersExtensions
  module Helpers
    extend ApplicationHelper
  end
  
  def helper(*args)
    Helpers.send(*args)
  end
end

ActiveAdmin::ResourceDSL.send(:include, HelpersExtensions)
ActiveAdmin::Views::Pages::Form.send(:include, HelpersExtensions)
  
ActiveAdmin.setup do |config|
  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  #
  config.site_title = "Senergy"

  # Set the link url for the title. For example, to take
  # users to your main site. Defaults to no link.
  #
  # config.site_title_link = "/"

  # Set an optional image to be displayed for the header
  # instead of a string (overrides :site_title)
  #
  # Note: Recommended image height is 21px to properly fit in the header
  #
  # config.site_title_image = "/images/logo.png"

  # == Default Namespace
  #
  # Set the default namespace each administration resource
  # will be added to.
  #
  # eg:
  #   config.default_namespace = :hello_world
  #
  # This will create resources in the HelloWorld module and
  # will namespace routes to /hello_world/*
  #
  # To set no namespace by default, use:
  #   config.default_namespace = false
  #
  # Default:
  # config.default_namespace = :admin
  #
  # You can customize the settings for each namespace by using
  # a namespace block. For example, to change the site title
  # within a namespace:
  #
  #   config.namespace :admin do |admin|
  #     admin.site_title = "Custom Admin Title"
  #   end
  #
  # This will ONLY change the title for the admin section. Other
  # namespaces will continue to use the main "site_title" configuration.

  # == User Authentication
  #
  # Active Admin will automatically call an authentication
  # method in a before filter of all controller actions to
  # ensure that there is a currently logged in admin user.
  #
  # This setting changes the method which Active Admin calls
  # within the controller.
  config.authentication_method = :authenticate_admin_user!

  # == Current User
  #
  # Active Admin will associate actions with the current
  # user performing them.
  #
  # This setting changes the method which Active Admin calls
  # to return the currently logged in user.
  config.current_user_method = :current_admin_user

  # == Logging Out
  #
  # Active Admin displays a logout link on each screen. These
  # settings configure the location and method used for the link.
  #
  # This setting changes the path where the link points to. If it's
  # a string, the strings is used as the path. If it's a Symbol, we
  # will call the method to return the path.
  #
  # Default:
  config.logout_link_path = :destroy_admin_user_session_path

  # This setting changes the http method used when rendering the
  # link. For example :get, :delete, :put, etc..
  #
  # Default:
  # config.logout_link_method = :get


  # == Admin Comments
  #
  # Admin comments allow you to add comments to any model for admin use.
  # Admin comments are enabled by default.
  #
  # Default:
  # config.allow_comments = true
  #
  # You can turn them on and off for any given namespace by using a
  # namespace config block.
  #
  # Eg:
  #   config.namespace :without_comments do |without_comments|
  #     without_comments.allow_comments = false
  #   end

  # == Controller Filters
  #
  config.before_filter :set_admin_locale
  
  def set_admin_locale
    I18n.locale = :es 
  end  

  config.register_stylesheet 'markdown.css'
  config.register_stylesheet 'jquery-ui-1.8.18.custom.css'
  config.register_stylesheet 'jquery-ui-timepicker-addon.css'
  config.register_stylesheet "chosen"
  
  config.register_javascript "jquery_extensions"
  config.register_javascript "jquery-ui-timepicker-addon"
  
  config.register_javascript "underscore"
  config.register_javascript "underscore_extensions"
  
  config.register_javascript "Markdown.Converter"
  config.register_javascript "Markdown.Sanitizer"
  config.register_javascript "Markdown.Editor"
  
  config.register_javascript "items_list"
  config.register_javascript "chosen.jquery"

  I18n.locale = :es
  
  config.default_per_page = 20
end
