require 'rails_helper'

RSpec.describe Department, type: :model do
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
    it "should belongs_to country" do
      expect(@department).to belong_to(:country)
    end

    it 'should have many cities' do
      expect(@department).to have_many(:cities)
    end
  end

  context "validations" do
    it "is valid with valid attributes" do
      expect(@department).to be_a(Department)
    end

    it "should have a certain format" do
      invalid_department = FactoryBot.build(:department, department_name: "V2ar")
      expect(invalid_department).not_to be_valid
      expect(invalid_department.errors.include?(:department_name)).to eq(true)
    end
  end
end