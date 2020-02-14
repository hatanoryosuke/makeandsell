class GenresController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
  end

  def new
    @genre = Genre.new
    # @genre.items << current_items
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to root_path, notice: 'ジャンルを作成しました'
    else
      render :new, fales: '失敗しました。'
    end
  end

  def edit
  
  end
    
  def update
    if @genre.update(genre_params)
      redirect_to genre_messages_path(@genre), notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  def show
    @genre = Genre.find(params[:id])
    @items = @genre.items.order("created_at DESC")
    @genres = Genre.all
  end


  private
    def genre_params
      params.require(:genres).permit(:name)
    end

end
