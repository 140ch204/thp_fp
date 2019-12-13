require 'rails_helper'
RSpec.describe Project, type: :model do
  before(:each) do
    @project = FactoryBot.build(:project)
    @country = FactoryBot.build(:country)
    @city = FactoryBot.build(:city)
    @user = FactoryBot.build(:user)
    @department = FactoryBot.build(:department, country: @country)
    @company = FactoryBot.build(:company)
    @organization = FactoryBot.build(:organization)
    @association = FactoryBot.build(:association)
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
    expect(build(:country)).to be_valid
    expect(build(:city)).to be_valid
    expect(build(:department)).to be_valid
    expect(build(:organization)).to be_valid
    expect(build(:association)).to be_valid
    expect(build(:company)).to be_valid
  end
  
  context 'associations' do
    it 'should belong to an organization and a city' do
      expect(@project).to belong_to(:organization)
      expect(@project).to belong_to(:city)
    end

    it 'should have many donations and alerts' do
      expect(@project).to have_many(:donations)
      expect(@project).to have_many(:alerts)
    end

    it 'should have many likes and project_links' do
      expect(@project).to have_many(:likes)
      expect(@project).to have_many(:project_links)
    end
    it 'should have many admins' do
      expect(@project).to have_many(:admins)
    end
  end

  context 'validations' do
    it "is valid with valid attributes" do
      expect(@project).to be_a(Project)
    end

    it "should be an url" do
  end
end
