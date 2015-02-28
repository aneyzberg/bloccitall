class AdvertisementsController < ApplicationController
  
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end 

  def create
    @advertisement = Advertisement.new(params.require(:advertisement).permit(:title, :copy, :price))

    if @advertisement.save
      flash[:notice] = "Your advertisement was saved successfully"
      redirect_to @advertisement
    else
      flash[:error] = "Your advertisement was not saved. Please try again"
      render :new
    end
  end


  def edit
    @advertisement = Advertisement.find(params[:id])
  end


  def update
    @advertisement = Advertisement.find(params[:id])

    if @advertisement.update_attributes(params.require(:advertisement).permit(:title, :copy, :price))
    flash[:notice] = "Your advertisement has been updated"
    redirect_to @advertisement
    else
    flash[:notice] = "There was an error updating your advertisement. Please try again"
    render :edit
    end
  end
end
