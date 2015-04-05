class HomeController < ApplicationController
  def index
  	@tasks = Task.accessible_by(current_ability)
  end
end
