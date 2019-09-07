class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      @card.valid?
      render action: :new
    end
  end

  private

    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
      # merge(user: current_user)
    end
end
