class WelcomeController < ApplicationController
  @page_title = "Bienvenue"
  def index
    if current_user
      redirect_to challenges_path
    end

  end
end
