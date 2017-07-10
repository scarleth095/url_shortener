class PagesController < ApplicationController
    skip_before_filter :verify_authenticity_token  
    def home
        @alert=false
        @hash_key=false
        @records=Url.order(count: :desc).limit(100)
        @base_url=request.base_url+"/"
        if params[:alert].present?
            @alert=params[:alert]
        end
        if params[:hash_key].present?
            @hash_key=params[:hash_key]
            @short_url=@base_url+@hash_key
            @long_url=params[:long_url]
        end
        
    end
    def url_direct
        id=params[:short_url_key].to_i(36)
        @url_key=Url.find(id)
        if (@url_key!=nil)
            @url_key.count+=1
            @url_key.save
            redirect_to @url_key.long_url
        else
            redirect_to action: 'home', alert: 'ALERT !! : THIS URL WAS NOT FOUND'
        end
    end
    def create 
        long_url=params[:long_url]
        @new_url=Url.create(long_url: long_url)
        hash=@new_url.idKey
        redirect_to action: 'home', hash_key: hash, long_url: long_url
    end
end
