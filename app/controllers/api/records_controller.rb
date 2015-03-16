class Api::RecordsController < Api::ApiController
  before_action :set_student
  before_action :set_classroom

  def check_in
    if @class_room.present? && @class_room.allowed_location?

    else

    end
  end

  def keep_online
  end

  def check_out

  end

  def leave_early

  end

  private

  def set_student
    @student = Student.find_by_student_number(params[:student_id])
  end
end
