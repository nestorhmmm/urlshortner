class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    link = Link.where(:new_url=>params[:id]).first

    if link
      redirect_to link.given_url
    else
      render "index"
    end
  end

  def new
    @link = Link.new

    letters = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    @link.new_url = (0...8).map{ letters[rand(letters.length)] }.join
  end


  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_path, notice: 'url was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private

  def link_params
    params.require(:link).permit(:given_url, :new_url)
  end


end
end
