class WebsitesController < ApplicationController

    def index
        @websites = Website.all
    end

    def show
        @website = id(Website)
    end

    def create
        website = current_user.websites.create(website_params)
        session_save(2, website)
        current_website.content = Content.create
        redirect_to home_path
    end

    def image
        @image = Website.find(6).uploads.find(12)
    end

    def update
        binding.pry
    end

    def search
        invitations = id(Website).invitations
        @results = invitations.find_by(search_params)
        @website = id(Website)
        render 'websites/results'
    end


    private

    def website_params
        params.require(:website).permit(:key, uploads: [])
    end

    def search_params
        params.permit(:first_name, :last_name)
    end

end
