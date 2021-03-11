class ApplicationController < ActionController::Base


    before_action :authenticate_user!
    include Pundit
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    #this is for meta_tags run to set domain: heroku config:set DOMAIN=www.my_product.com
    def default_url_options
      { host: ENV["DOMAIN"] || "localhost:3000" }
    end

    private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^userProducts$)/
    end
end
