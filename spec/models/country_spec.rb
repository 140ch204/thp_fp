require 'rails_helper'

RSpec.describe Department, type: :model do
  before(:each) do
    @country = FactoryBot.build(:country)
  end

  it "has a valid factory" do
    expect(build(:country)).to be_valid
  end

  context "validations" do
    it "should be valid with valid attributes" do
      expect(@country).to be_a(Country)
    end

    it "should have a certain format" do
      invalid_country = FactoryBot.build(:country, country_name: "France2")
      expect(invalid_country).not_to be_valid
      expect(invalid_country.errors.include?(:country_name)).to eq(true)
    end
  end

  context "associations" do
    it 'should have many departments' do
      expect(@country).to have_many(:departments)
    end
  end
end
