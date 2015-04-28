class AnnouncesController < ApplicationController
  before_action :find_announce, only: [:show, :edit, :update, :destroy ]


  def index
    @announces = Announce.all
  end

  def new
    @announce = Announce.new

  end

  def create
    @announce = Announce.new(announce_params)
      if @announce.save
        redirect_to announce_path(@announce)
      else
        render :new
      end
  end

  def show


  end

  def update
    if @announce.update(announce_params)
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
    @announce = Announce.find(params[:id])
  end

end
