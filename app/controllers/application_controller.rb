class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.student?
      students_path
    elsif resource.teacher?
      teachers_path
    else
      root_path
    end
  end
end
