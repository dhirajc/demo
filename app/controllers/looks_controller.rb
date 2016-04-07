class LooksController < ApplicationController
    
  def index
    @looks = Look.all
  end

  def new
    @looks = Look.new
  end

  def create
    @look = Look.new(look_params)
      if @look.save
        flash[:notice] = "look successfully created"
        redirect_to look_index_path
      else
        render :action => 'new'
      end
    end

  def update
       if @look.update(look_params)
        flash[:notice] = 'Successfully updated'
        redirect_to looks_new_path
      else
        render 'edit'
      end
  end

  def destroy
    @look = Look.find(params[:id])
    @look.destroy
    flash[:notice] = "look successfully destroyed "
    redirect_to :back

  end

  def show
  end



  private 
   
   def looks_params
    params.require(:look).permit(:name,:neckwear,:shirts,:shoes,:user_id,:product_id)
   end
end