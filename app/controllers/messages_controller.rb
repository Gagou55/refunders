class MessagesController < ApplicationController
  def create
    @announce = Announce.find(params[:announce_id])
    current_user.send_message(@announce, params[:body], params[:subject])

    flash[:notice] = "Message successfully sent"
    redirect_to announce_path(@announce)
  end
end