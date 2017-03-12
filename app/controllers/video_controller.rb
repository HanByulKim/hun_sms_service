class VideoController < ApplicationController
    def index
        @video = Video.paginate(page: params[:page], per_page: 3)
        respond_to do |format|
            format.html
            format.json{ render json: @video }
        end
    end
    
    def player
        @play = Video.find(params[:id])
    end
end