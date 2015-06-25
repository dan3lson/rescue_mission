require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "associatons" do
    it { should belong_to(:question) }
  end

  describe "validations" do
    it { should validate_presence_of(:description) }
  end

  describe "#initialization" do
    let(:answer) { FactoryGirl.create(:answer) }
    it "returns a description string" do
      expect(answer.description).to include("description")
    end
  end
end
