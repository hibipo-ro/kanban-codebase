class ListController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else 
      #validationに引っかかったらnewアクションに飛ばす 
      @list.valid?
      render action: :new 
    end  
  end


  def edit 
    @list = List.find(params[:id])
  end


  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to :root
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to :root
  end


  private 
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end
end
