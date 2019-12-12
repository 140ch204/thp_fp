require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @country = FactoryBot.build(:country)
    @city = FactoryBot.build(:city)
    @user = FactoryBot.build(:user)
    @department = FactoryBot.build(:department, country: @country)
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
    expect(build(:country)).to be_valid
    expect(build(:city)).to be_valid
    expect(build(:department)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end
  end

  context "associations" do
    it "should have many likes" do
      expect(@user).to have_many(:likes)
    end

    it "should have many follows" do
      expect(@user).to have_many(:follows)
    end

    it "should have many alerts" do
      expect(@user).to have_many(:alerts)
    end
  end
end
