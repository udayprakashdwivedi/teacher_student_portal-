require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:teacher) { Teacher.create!(email: "teacher@example.com", password: "password", password_confirmation: "password") }
  let(:student) { Student.create!(name: "John Doe", subject: "Math", marks: 90, teacher: teacher) }

  before { session[:teacher_id] = teacher.id }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new student" do
      expect {
        post :create, params: { student: { name: "Jane Doe", subject: "Science", marks: 85 } }
      }.to change(Student, :count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates an existing student" do
      put :update, params: { id: student.id, student: { name: "Updated Name" } }
      student.reload
      expect(student.name).to eq("Updated Name")
    end
  end

  describe "DELETE #destroy" do
    it "deletes a student" do
      student = Student.create!(name: "Mark", subject: "Physics", marks: 75, teacher: teacher)
      expect {
        delete :destroy, params: { id: student.id }
      }.to change(Student, :count).by(-1)
    end
  end
end
