class StudentsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create]
  before_action :require_login

  def index
    @students = Student.where(teacher_id: current_teacher.id)
  end

  def create
    existing_student = Student.find_by(name: student_params[:name], subject: student_params[:subject], teacher_id: current_teacher.id)
    if existing_student
      existing_student.update(marks: existing_student.marks + student_params[:marks].to_i)
    else
      Student.create(student_params.merge(teacher_id: current_teacher.id))
    end
    head :ok
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    head :ok
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    head :ok
  end

  private

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end

  def require_login
    unless current_teacher
      redirect_to login_path, alert: "Please log in to access this page."
    end
  end

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
end
