module ShopifyApp
  module Localization
    extend ActiveSupport::Concern

    def set_locale
      if params[:locale]
        session[:locale] = params[:locale]
      else
        session[:locale] ||= I18n.default_locale
      end
      I18n.locale = session[:locale]
    rescue I18n::InvalidLocale
      I18n.locale = I18n.default_locale
    end
  end
end
