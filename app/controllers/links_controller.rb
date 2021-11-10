class LinksController < ApplicationController
  before_action :set_link, only: [:destroy, :redirect_to_original_url]
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(permitted_params)
    @link.sluged_url = @link.short

    if @link.save
      flash.now[:success] = 'Url slug created successfully'
      redirect_to links_path
    else
      flash.now[:error] = @link.errors.full_messages
      render :new
    end
  end

  def destroy
    if @link.delete
      flash.now[:success] = 'Url slug deleted successfully'
      redirect_to links_path
    else
      flash.now[:error] = link.errors.full_messages
    end
  end

  def redirect_to_original_url
    redirect_to @link.original_url
  end

  private
  def permitted_params
    params.require(:link).permit(:original_url, :url_slug)
  end

  def set_link
    @link = Link.find_by_url_slug(params[:id] || params[:slug])
    raise ActiveRecord::RecordNotFound  if @link.blank?
    @link
  end
end
