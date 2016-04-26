class LooksController < ApplicationController
    
  def index
    #@looks = Look.all
    @looks = Look.where(:user_id => current_user.id)
  end

  def new
    @look = Look.new
  end

  def create
    #raise "hi"
    binding.pry
    @look = Look.new(looks_params)
    #@look.update_column(:user_id => current_user.id)
      if @look.save
        flash[:notice] = "look successfully created"
        redirect_to looks_path
      else
        render :action => 'new'
      end
    end
    def edit
      @look = Look.find(params[:id])
    end

  def update
  @look = Look.find(params[:id])
    if @look.update_attributes(looks_params)
      flash[:notice] = 'Successfully updated'
      redirect_to new_look_path
    else
      render 'edit'
    end
  end

  def destroy
    @look = Look.find(params[:id])
    @look.destroy
    flash[:notice] = "look successfully destroyed"
    redirect_to looks_path
  end

  def show
    @look = Look.find(params[:id])
  end

  private 
   
   def looks_params
    params.require(:look).permit(:name,:neckwear,:shirts,:shoes,:user_id,:product_id)
   end
end