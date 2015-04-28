class AnnouncesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @announces = Announce.all
  end

  # def new
  #   @announce = Announce.new

  # end

  # def create
  #   @announce = Announce.new(announce_params)
  #     if @announce.save
  #       redirect_to announce_path(@announce)
  #     else
  #       render :new
  #     end
  # end

  def show
    @announce = Announce.find(params[:id])
  end

  # def update
  #   if @announce.update(announce_params)
  #     redirect_to @announce
  #   else
  #     render :edit
  #   end
  # end

  # def edit

  # end

  # def destroy
  #   @announce.destroy
  #     redirect_to root_path, notice: "l'annonce a bien été supprimée"

  # end

  private

  def announce_params
    params.require(:announce).permit(:title, :price, :kind, :number_of_share, :reason, :company_id)
  end

end
