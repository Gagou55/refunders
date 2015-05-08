class PaymentsController < ApplicationController
  before_action :set_order

  def new

  end

  def create
    @amount = @purchase.amount_cents

    customer = Stripe::Customer.create(
      email:  @purchase.user.email,
      card:   params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @amount,
      description:  "Paiement de #{@purchase.announce.number_of_share} #{@purchase.announce.kind.name} #{@purchase.announce.company.name}, ref:#{@purchase.announce_sku} for order #{@purchase.id} pour un prix de #{@purchase.announce.price}",
      currency:     'eur'
    )

    @purchase.update(payment: charge.to_json, state: 'payed')
    @purchase.announce.update(published: false)

    redirect_to account_purchases

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@purchase)
  end

private

  def set_order
    @purchase = Purchase.where(state: 'pending').find(params[:purchase_id])
  end
end
