class AnnouncesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @companies = Company.where("sector = ?", params[:search_sector])
    @company_id = []
    @companies.each do |company|
      @companies_id << company.id
    end
    # Récupérer toutes les annonces dont la company est comprise dans @company
    @announces = []
    @companies_id.each do |id|
      Announce.all.each do |announce|
        @announces << announce if (announce.company_id = id)
      end

      # @kind = Kind.find_by_name(params[:kind])
      # @new_announces = @announces.where("kind_id = ?", @kind.id)
    end


    # if params[:search_sector]
    #   @announces = Announce.search(params[:search_sector])
    # else
    #   @announces = Announce.all
    # end
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
