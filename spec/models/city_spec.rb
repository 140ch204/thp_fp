require 'rails_helper'

RSpec.describe City, type: :model do
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

  context "associations" do
    it "should belongs_to department" do
      expect(@city).to belong_to(:department).optional
    end

    it "should have many users" do
      expect(@city).to have_many(:users)
    end
    
    it "should have many projects" do
      expect(@city).to have_many(:projects)
    end

    it "should have many organizations" do
      expect(@city).to have_many(:organizations)
    end
    
    it "should have many alerts" do
      expect(@city).to have_many(:alerts)
    end
  end

  context "validations" do
    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
    end

    it "should have a certain format" do
      invalid_user = FactoryBot.build(:city, city_name: "T2oulon")
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors.include?(:city_name)).to eq(true)
    end
  end
end
