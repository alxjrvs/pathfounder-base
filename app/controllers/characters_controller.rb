class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = Character.create!
    redirect_to character_path(@character)
  end

  def show
    @character = Character.find(params[:id])
  end
end
