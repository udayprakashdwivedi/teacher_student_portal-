require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:teacher) { Teacher.create!(email: "teacher@example.com", password: "password", password_confirmation: "password") }

  describe "POST #create" do
    it "logs in a teacher with correct credentials" do
      post :create, params: { email: teacher.email, password: "password" }
      expect(session[:teacher_id]).to eq(teacher.id)
    end

    it "does not log in a teacher with incorrect credentials" do
      post :create, params: { email: teacher.email, password: "wrongpassword" }
      expect(session[:teacher_id]).to be_nil
    end
  end

  describe "DELETE #destroy" do
    it "logs out the teacher" do
      delete :destroy
      expect(session[:teacher_id]).to be_nil
    end
  end
end
