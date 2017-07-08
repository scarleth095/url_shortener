class PagesController < ApplicationController
    def home
        @alert="none"
        @records=Url.all
        if params[:alert].present?
            @alert=params[:alert]
        end 
    end
    
    def url_direct
        url_key=Url.find_by(short_url_key: params[:short_url_key])
        if (url_key!=nil)
            redirect_to url_key.long_url
        else
            redirect_to action: 'home', alert: 'Url not found'
        end
    end
end
