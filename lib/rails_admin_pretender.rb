require 'pretender'
require_relative '../rails_admin/config/actions/impersonate'

module RailsAdminPretender
  extend ActiveSupport::Concern

  def self.init
    RailsAdmin::MainController.extend(::Pretender::Methods)
    RailsAdmin::MainController.impersonates(:user)
  end

  def is_impersonating?
    true_user != current_user
  end

  included do
    if respond_to?(:impersonates)
      impersonates(:user)
    end
    if respond_to?(:helper_method)
      helper_method :is_impersonating?
    end
  end
end

I18n.load_path += Dir.glob(File.expand_path("../../config/locales/*.{rb,yml}", __FILE__))
