class WelcomeController < ApplicationController
  def index
  end

  def stud_data
  	render json: User.all.to_json
  end
end
