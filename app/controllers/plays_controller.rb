class PlaysController < ApplicationController
  def index
    @plays = Play.all.order(created_at: :desc).limit(3)
  end

  def new
    @play = Play.new
    @play.multiplier = :single
  end

  def create
    @play = Play.create(word: params[:play][:word], multiplier: params[:play][:multiplier])
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
