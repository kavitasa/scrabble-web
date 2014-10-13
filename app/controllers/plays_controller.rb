class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.create(word: params[:play][:word])
    if @play.valid?
      redirect_to plays_path
    else
      render new_play_path
    end
  end
end
