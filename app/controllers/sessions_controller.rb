class SessionsController < ApplicationController
  def create
    teacher = Teacher.find_by(email: params[:email])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      redirect_to students_path, notice: "Login successful!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to login_path, notice: "Logged out successfully."
  end
end