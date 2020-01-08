class ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  def search
    @items = Item.search(params[:keyword])
    @genre = Genre.all
  end


  private
  def item_params
    params.require(:item).permit(:price, :name, :image ).merge(user_id: current_user.id)
  end
end
