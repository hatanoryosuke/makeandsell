class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
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
    @genres = Genre.all
  end

  def show
    @items = Item.find(params[:id])
    @comment = Comment.new
    @comments = @items.comments.includes(:user).order("created_at DESC")
    @price = @items.comments.where.not(price: nil).average(:price)
    @max = @items.comments.where.not(price: nil).maximum(:price)
    @low = @items.comments.where.not(price: nil).minimum(:price)
    @count = @items.comments.where.not(text: nil).count
    @evaluation = @items.comments.where.not(price: nil).count
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
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:price, :name, :image, :size_w, :size_d, :size_h, :text,{genre_ids:[]}).merge(user_id: current_user.id)
  end

end
