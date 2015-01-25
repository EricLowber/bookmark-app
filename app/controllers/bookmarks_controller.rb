class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
  end

  def edit
  end

  def show
  end
  
end
