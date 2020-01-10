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

  def show
    @items = Item.find(params[:id])
    @comment = Comment.new
    @comments = @items.comments.includes(:user)
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:price, :name, :image, :size_w, :size_d, :size_h, :text,).merge(user_id: current_user.id)
  end
  
end
