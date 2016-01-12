require 'rails_helper'

describe NullSkillList do
  before do
    @list = NullSkillList.new
  end

  Skills::ALL.each do |sk|
    describe ".#{sk}" do
      it "returns a NullSkill" do
        expect(@list.send(sk).class).to eq NullSkill
      end
    end
  end

  describe "nil?" do
    it "is true" do
      expect(@list).to be_nil
    end
  end
end
