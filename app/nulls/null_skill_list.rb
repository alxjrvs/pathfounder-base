class NullSkillList
  include Null
  Skills::ALL.each do |sk|
    define_method "#{sk}_val" do
      0
    end
  end
end
