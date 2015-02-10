require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        describe "#up_vote.valid?" do
            it "returns true for upvote" do
                v = Vote.new(value: 1)
                expect ( v.valid? ).to eq(true)
            end
        end
        
        describe "#down_vote.valid?" do
            it "returns true for downvote" do
                v = Vote.new(value: -1)
                expect (v.valid?).to eq(true)
            end
        end
        
        describe "#invalid_vote.valid?" do
            it "returns false for invalidvote"
                v = Vote.new(value: 2)
                expect (v.valid?).to eq(false)
            end
        end
    end
  end
end