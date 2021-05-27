class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(list)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
