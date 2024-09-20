require 'rails_helper'

RSpec.describe Teacher, type: :model do
  subject { Teacher.new(email: "test@test.com", password: "password", password_confirmation: "password") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a unique email" do
    Teacher.create!(email: "test@test.com", password: "password", password_confirmation: "password")
    expect(subject).not_to be_valid
  end
end
