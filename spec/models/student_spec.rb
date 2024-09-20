require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:teacher) { Teacher.create!(email: "teacher@example.com", password: "password", password_confirmation: "password") }
  subject { Student.new(name: "John Doe", subject: "Math", marks: 90, teacher: teacher) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "is not valid with marks less than 0" do
    subject.marks = -1
    expect(subject).not_to be_valid
  end

  it "belongs to a teacher" do
    expect(subject.teacher).to eq(teacher)
  end
end
