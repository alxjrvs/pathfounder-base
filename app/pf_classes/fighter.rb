class Fighter < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 10
  alignment :any

  class_skills :climb, :craft, :handle_animal
  skill_ranks_per_level 2

  base_attack_bonus      1
  mods feat_count:       1
  mods fortitude_save:  -2
  mods will_save:        0
  mods reflex_save:      0

  adds weapon_proficiency: [:simple, :martial]
  adds armor_proficiency: [:all]
  adds shield_proficiency: [:all]

  special :extra_feat
end
