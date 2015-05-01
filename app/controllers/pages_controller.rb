class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @announces = Announce.where(published: true)
    @announces = @announces.sample(3)
  end
end
