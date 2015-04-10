class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      redirect_to @wiki, notice: "Wiki saved succesfully!"
    else
      render :new, error: "There was an error creating your wiki! Please try again"
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      redirect_to @wiki
    else
      render :edit, error: "There was an error saving the post. Please try again."
    end
  end

    def destroy
      @wiki = Wiki.find(params[:id])
      title = @wiki.title
      if @wiki.destroy
        redirect_to wikis_path, notice: "\"#{title}\" was deleted successfully."
      else
        render :show, error: "There was an error deleting your wiki!"
      end
    end


  #| = = = = = = = = = = = = = = =*/
  #| = = = PRIVATE METHODS = = = */
  #| = = = = = = = = = = = = = =*/
  
  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
