module Account
  class PurchasesController < ApplicationController
    before_action :find_purchase, only: [:show]

    def index
      @purchases = current_user.purchases
    end

    def show
      @purchase = current_user.purchases.find(params[:id])
    end

    private

    def find_purchase
      @purchase = current_user.purchases.find(params[:id])
    end
  end
end