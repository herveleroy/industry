class ReportingController < ApplicationController

  def dendogram
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def sankey
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def dynamic_tree
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def pack_hierarchy
     @challenge = Challenge.find(current_user.current_challenge)
  end


end
