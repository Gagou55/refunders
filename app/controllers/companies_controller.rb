class CompaniesController < ApplicationController
skip_before_filter  :verify_authenticity_token
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to :back
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit( :name, :summary, :general_information, :business_model, :development, :vision, :swot, :team, :logo, :ipo_company_id)
  end

end
