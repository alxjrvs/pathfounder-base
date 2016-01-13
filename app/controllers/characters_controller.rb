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
    Level.create(character: character) unless character.level.present?
    if character.sheet.favored_class.class != chosen_pf_class
      new_pf_class = chosen_pf_class.create
      character.level.update_attributes(pf_class: new_pf_class)
    end
    redirect_to character_path character
  end

  def edit_race
    @character = character
  end

  def update_race
    if character.sheet.race.class != chosen_race
      new_race = chosen_race.create
      character.update_attributes(race: new_race)
    end
    if character.race.class == Human && params[:human_ability_bonus].present?
      character.race.update_attributes(ability_bonus: params[:human_ability_bonus])
    end
    redirect_to character_path character
  end

  def edit_stats
    @character = character
    @stat_block = character.stat_block || StatBlock.create(character: character)
  end

  def update_stats
    character.stat_block.update_attributes stat_block_params
    redirect_to character_path character
  end

  def edit_skills
    @character = character
    @skill_list = character.skill_list || SkillList.create(character: character)
  end

  def update_skills
    character.skill_list.update_attributes skill_list_params
    redirect_to character_path character
  end

  private

  def chosen_race
    Races::ALL[params[:chosen_race].downcase.to_sym]
  end

  def chosen_pf_class
    PFClasses::ALL[params[:chosen_class].downcase.to_sym]
  end


  def skill_list_params
    params.require(:skill_list).permit(
      :acrobatics_val,
      :appraise_val,
      :bluff_val,
      :climb_val,
      :craft_1_val,
      :craft_2_val,
      :craft_3_val,
      :craft_1_name,
      :craft_2_name,
      :craft_3_name,
      :diplomancy_val,
      :disable_device_val,
      :disguise_val,
      :escape_artist_val,
      :fly_val,
      :handle_animal_val,
      :heal_val,
      :intimidate_val,
      :knowledge_arcana_val,
      :knowledge_dungeoneering_val,
      :knowledge_engineering_val,
      :knowledge_geography_val,
      :knowledge_history_val,
      :knowledge_local_val,
      :knowledge_nature_val,
      :knowledge_nobility_val,
      :knowledge_planes_val,
      :knowledge_religion_val,
      :linguistics_val,
      :perception_val,
      :perform_1_val,
      :perform_2_val,
      :perform_3_val,
      :perform_1_name,
      :perform_2_name,
      :perform_3_name,
      :profession_val,
      :profession_name_val,
      :ride_val,
      :sense_motive_val,
      :sleight_of_hand_val,
      :spellcraft_val,
      :stealth_val,
      :survival_val,
      :swim_val,
      :use_magic_device_val
    )
  end

  def stat_block_params
    params.require(:stat_block).permit(
      :wisdom_val,
      :charisma_val,
      :constitution_val,
      :intelligence_val,
      :strength_val,
      :dexterity_val
    )
  end

  def general_info_params
    params.require(:character).permit(:name)
  end

  def character
    Character.find(params[:id]) 
  end
end

