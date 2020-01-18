require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "does not allow duplicate project names per user" do
    user = User.create(
      first_name: "Joe",
      last_name: "Smith",
      email: "tetster@example.com",
      password: "aaaaaaaaaaaaaaa"
    )

    user.projects.create(
      name: "Test Project"
    )

    new_project = user.projects.build(
      name: "Test Project"
    )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do
    user = User.create(
      first_name: "Joe",
      last_name: "Smith",
      email: "tetster@example.com",
      password: "aaaaaaaaaaaaaaa"
    )

    user.projects.create(
      name: "Test Project"
    )

    other_user = User.create(
      first_name: "Jane",
      last_name: "Smith",
      email: "janetetster@example.com",
      password: "aaaaaaaaaaaaaaa"
    )

    other_project = other_user.projects.build(
      name: "Test Project"
    )

    expect(other_project).to be_valid
  end

  it "is late when the due date is past today" do
    project = FactoryBot.create(:project_due_yesterday)
    expect(project).to be_late
  end

  it "can have many notes" do
    project = FactoryBot.create(:project, :with_notes)
    expect(project.notes.length).to eq 5
  end
end
