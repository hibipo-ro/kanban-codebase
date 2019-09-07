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

  def show
    @card = Card.find(params[:id])
  end

  def edit 
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    redirect_to :root
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to :root
  end


  private

    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
      # merge(user: current_user)
    end
end
