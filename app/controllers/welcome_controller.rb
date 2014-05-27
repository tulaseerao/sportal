class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def stud_data
  	render json: User.all.to_json
  end

  def dept_data
    render json: Department.all.order(:name).select([:id,:name,:description]).to_json
  end
end
