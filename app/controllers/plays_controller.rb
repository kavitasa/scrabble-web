class PlaysController < ApplicationController
  def index
      @plays = Play.all.order(created_at: :desc).limit(3)
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

  def destroy
    Play.find(params[:id]).destroy
    redirect_to plays_path
  end
end
