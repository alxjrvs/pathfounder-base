class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = Character.create!
    Level.create!(character: @character)
    redirect_to character_path(@character)
  end

  def show
    @character = character
  end

  def edit_general_info
    @character = character
  end

  def update_general_info
    character.update_attributes!(general_info_params)
    redirect_to character_path character
  end

  def edit_pf_class
    @character = character
  end

  def update_pf_class
    binding.pry
  end

  private

  def chosen_pf_class
    PFClasses::ALL[params[:chosen_class].downcase.to_sym]
  end

  def general_info_params
    params.require(:character).permit(:name)
  end

  def character
    Character.find(params[:id]) 
  end
end

