require 'rails_helper'
RSpec.describe Organization, type: :model do
  before(:each) do
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

  context "associations" do
    it "should belong to a city" do
      expect(@organization).to belong_to(:city)
    end
    it "should have many admins" do
      expect(@organization).to have_many(:admins)
    end
    it "should have many projects" do
      expect(@association).to have_many(:projects)
    end
    it "should have many donations" do
      expect(@company).to have_many(:donations)
    end
    it "should have many follows" do
      expect(@organization).to have_many(:follows)
    end
    it "should have many tag lists" do
      expect(@organization).to have_many(:tag_lists)
    end
    it "should have many alerts" do
      expect(@organization).to have_many(:alerts)
    end
    it "should have many organization links" do
      expect(@organization).to have_many(:organization_links)
    end
    it "should have many tags" do
      expect(@organization).to have_many(:tags)
    end
    it "should have many users" do
      expect(@organization).to have_many(:users)
    end
  end

  context "validations" do
    it "is valid with valid attributes" do
      expect(@organization).to be_a(Organization)
      expect(@company).to be_a(Organization)
      expect(@association).to be_a(Organization)
    end

    describe "#description" do
      it { expect(@organization).to validate_presence_of(:description) }
    end

    describe "#category" do
      it { expect(@organization).to validate_presence_of(:category) }
    end

    describe "#name" do
      it { expect(@organization).to validate_presence_of(:name) }
      it { expect(@organization).to validate_uniqueness_of(:name) }
    end

    describe "#siret" do
      it { expect(@company).to validate_presence_of(:siret) }
      it { expect(@company).to validate_uniqueness_of(:siret).case_insensitive }
      it "should have a certain format" do
        invalid_organization = FactoryBot.build(:company, siret: "wé32123D15")
        expect(invalid_organization).not_to be_valid
        expect(invalid_organization.errors.include?(:siret)).to eq(true)
      end
    end
    describe "#RNA" do
      it { expect(@association).to validate_presence_of(:RNA) }
      it { expect(@association).to validate_uniqueness_of(:RNA) }
      it "should have a certain format" do
        invalid_organization = FactoryBot.build(:association, RNA: "2é32123D15")
        expect(invalid_organization).not_to be_valid
        expect(invalid_organization.errors.include?(:RNA)).to eq(true)
      end
    end
  end

  context "public instance methods" do

    describe "#association?" do
      association { build(:association) }
      it { expect(@association).receive(:association?).and_return true }
      association.association?
    end
    describe "#some_method" do
      # teste cette méthode
    end
    describe "#some_method" do
      # teste cette méthode
    end
    describe "#some_method" do
      # teste cette méthode
    end
    describe "#some_method" do
      # teste cette méthode
    end

  end
end
