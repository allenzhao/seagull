class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  def index
    @students = Student.order('student_number DESC').page(params[:page])
    @student = Student.new
  end

  def show
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      @success = '保存成功'
    else
      @error = show_error @student
    end
    render 'refresh_student'
  end

  def edit
  end

  def update
    if @student.update(student_params)
      @success = '学生信息更新成功'
    else
      @error = show_error @student
    end
    render 'refresh_student'
  end

  def destroy
    if @student.destroy
      @success = '删除成功'
    else
      @error = show_error @student
    end
    render 'refresh_student'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :student_number, :school, :grade, :student_class, :major, :sex, :phone_number, :dyned_class, :email)
  end

end
