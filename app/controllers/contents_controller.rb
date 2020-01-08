class ContentsController < ApplicationController
  def index
    @contents = Content.all
    @genres = Genre.all
  end

  def new
    @contents = Content.new
  end

  def create
    Content.create(content_params)
  end

  private
  def content_params
    params.require(:content).permit(:name, :image, :text)
  end
end
