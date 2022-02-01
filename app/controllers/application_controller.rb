class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.student?
      student_path(resource)
    elsif resource.teacher?
      teacher_path(resource)
    else
      root_path
    end
  end
end
