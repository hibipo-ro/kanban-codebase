class TopController < ApplicationController

  def index
    @lists = List.where(user: current_user).order("created_at ASC")
    @cards = Card.where(list: list.id)
  end
 
end
