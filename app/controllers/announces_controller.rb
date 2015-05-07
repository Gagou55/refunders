class AnnouncesController < ApplicationController
  skip_before_action :authenticate_user!
  def index

    if params[:search_sector]
      @companies = Company.where("sector_id = ?", params[:search_sector])

      @announces = []

      @companies.each do |company|
        company.announces.each do |announce|
          @announces << announce
        end
      end

      @announces = @announces.select { |announce| announce.published == true }
      @announces = @announces.select { |announce| announce.kind_id.to_s == params[:search_kind] }

      min_price = params[:min_price]
      max_price = params[:max_price]

      @announces = @announces.select { |announce| announce.price >= min_price.to_i } if min_price.present?
      @announces = @announces.select { |announce| announce.price <= max_price.to_i } if max_price.present?

      @announces
    else
      @announces = Announce.all
      @announces = @announces.select { |announce| announce.published == true }
    end
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
    if user_signed_in?
      @purchase = current_user.purchases.new
    else
      @announce
    end
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
    params.require(:announce).permit(:title, :price, :number_of_share, :reason, :company_id, :kind_id)
  end

end
