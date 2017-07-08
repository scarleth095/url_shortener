class PagesController < ApplicationController
    skip_before_filter :verify_authenticity_token  
    def home
        @alert=false
        @hash_key=false
        @records=Url.all
        if params[:alert].present?
            @alert=params[:alert]
        end
        if params[:hash_key].present?
            @hash_key=params[:hash_key]
            @short_url=request.base_url+"/"+@hash_key
            @long_url=params[:long_url]
        end
    end
    def url_direct
        url_key=Url.find_by(short_url_key: params[:short_url_key])
        if (url_key!=nil)
            redirect_to url_key.long_url
        else
            redirect_to action: 'home', alert: 'ALERT !! : THIS URL WAS NOT FOUND'
        end
    end
    def create 
        @hash=SecureRandom.random_number(36**8).to_s(36).rjust(8, "0")
        @long_url=params[:long_url]
        Url.create(long_url: @long_url, short_url_key: @hash)
        redirect_to action: 'home', hash_key: @hash, long_url: @long_url
    end
end
