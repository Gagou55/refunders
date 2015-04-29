module Account
  class AnnouncesController < ApplicationController
    before_action :find_announce, only: [:show, :edit, :update, :destroy ]


    def index
      @announces = current_user.announces
    end

    def new
      @announce = current_user.announces.new
    end

    def create
      @announce = current_user.announces.new(announce_params)
      @company = Company.new
      if @announce.save
        redirect_to announce_path(@announce)
      else
        render :new
      end
    end

    def show


    end

    def update
      @announce.update(announce_params)

      if @announce.save
        redirect_to @announce
      else
        render :edit
      end
    end

    def edit

    end

    def destroy
      @announce.destroy
      redirect_to root_path, notice: "l'annonce a bien été supprimée"

    end

    private

    def announce_params
      params.require(:announce).permit(:title, :price, :kind, :number_of_share, :reason, :company_id)
    end

    def find_announce
      @announce = current_user.announces.find(params[:id])
    end
  end
end