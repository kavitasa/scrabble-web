class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
    @play = Play.new
  end

  def create
    Play.create(word: params[:play][:word].downcase)
    redirect_to plays_path
  end
end
