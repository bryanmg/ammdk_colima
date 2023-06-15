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

  rescue_from OverflowPaymentException do |e|
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to), alert: e.message
  end
end
