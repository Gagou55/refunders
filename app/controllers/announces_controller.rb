class AnnouncesController < ApplicationController


  def index
    @announces = Announce.all
  end

  def new
    @announces = Announce.new

  end

  def create

  end

  def show

  end

  def update

  end

  def edit

  end

  def destroy

  end

end
