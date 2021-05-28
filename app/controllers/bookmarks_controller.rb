class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # we need the list id to create a new bookmark:
    @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.list_id = params[:list_id]
    # Line above is equivalent to the 2 below:
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    # @bookmark will give back an instance of Bookmark with the bookmark_params that we collect in the form
    # @bookmark.list will be the instance of the list that the bookmark belongs to, i.e. it's giving us back the information of the list it belongs to / of the list we're trying to add the bookmark to
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # we want a user to be able to remove a movie from the list
  # and destroy the associated bookmark at the same time
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
    # permit the movie_id too!!!
    # you require bookmark because it's the key inside the params hash
    # and comment is the key included in the hash, which itself is the value of the bookmark key
  end
end
