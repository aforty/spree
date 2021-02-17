module Spree
  class LocaleController < Spree::StoreController
    def index
      render :index, layout: false
    end

    def set
      new_locale = params[:switch_to_locale] || params[:locale]

      if new_locale.present? && supported_locale?(new_locale)
        session[:locale] = new_locale
      end
      if new_locale == current_store.default_locale
        redirect_back_or_default root_path
      else
        redirect_back_or_default root_path(locale: new_locale)
      end
    end
  end
end
