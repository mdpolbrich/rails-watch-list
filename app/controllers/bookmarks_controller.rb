class BookmarksController < ApplicationController
  before_action :find_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = @bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
