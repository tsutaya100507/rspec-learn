require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a first name, last name email, and password" do
    user = User.new(
      first_name: "Aaron",
      last_name: "Summer",
      email: "tetster@example.com",
      password: "aaaaaaaaaaaaaaa"
    )
    expect(user).to be_valid
  end

  it "is invalid wihtout a first name" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid whithout an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid whith a duplicate email address" do 
    FactoryBot.create(:user, email: "tetster@example.com")
    user = FactoryBot.build(:user, email: "tetster@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as a string" do
    user = FactoryBot.build(:user, first_name: "JoeJoe", last_name: "Smithis")
    expect(user.name).to eq "JoeJoe Smithis"
  end
end
