FactoryGirl.define do
  factory :character do
    name "Ragnar"
    race {FactoryGirl.create :human}
    deity_name "Azathoth"
    alignment "Chaotic Good"
    factory :empty_character do
      name nil
      race { nil }
      deity_name nil
      alignment nil
    end
  end
end
