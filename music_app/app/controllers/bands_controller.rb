class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

    def set_band
        @band = Band.find(id: params[:id])
    end

    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new
        if @band.save
            redirect_to bands_url
        else
            render :new
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
        set_band
        if @band
            redirect_to bands_url
        else
            render :edit
        end
    end

    def show
        set_band
        render :show

    end

    def update
        set_band
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    def destroy
        set_band
        @band.destroy
        redirect_to bands_url
    end

    def band_params
        params.require(:band).permit(:name)
    end
end
