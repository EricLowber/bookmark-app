class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all

  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end

  def show
  end

  def create
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:title, :url))
    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to bookmarks_path
    else
      render :new
  end
 end
end