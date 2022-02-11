module Students
  class LearningResourcesController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      # TODO: fix this 'where' clausule to use @user.belt directly
      @learning_resources = LearningResource.where("belt <= ?", BELTS[@user.belt.to_sym])
    end

    private

    def set_user
      @user = User.find(params[:student_id])
    end
  end
end
