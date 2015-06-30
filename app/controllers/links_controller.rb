class LinksController < ApplicationController

  def index
    @links = Link.order("upvotes DESC")
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save()
      redirect_to links_path
    else
      render :new
    end
  end

  def update
    Link.find(params[:id]).increment!(:upvotes)
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:name, :url)
  end

end
