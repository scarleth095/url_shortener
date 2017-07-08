class PagesController < ApplicationController
    def home
    end
    
    def url_direct
        Urls.find_by(short_url_key: params[:short_url_key])
    end
end
