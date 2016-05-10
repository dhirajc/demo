class LooksController < ApplicationController
    
  def index
    #@looks = Look.all
    @looks = Look.where(:user_id => current_user.id)
  end

  def new
    @look = Look.new
  end

  def create

    @look = Look.new(looks_params)
    if (params[:look][:neckwear]).present?
      n_price = (Accessory.find(params[:look][:neckwear] ).price )
    else
      n_price = 0
    end
    if (params[:look][:shirts]).present? 
      shirt_price = (Accessory.find(params[:look][:shirts] ).price )
    else
      shirt_price = 0
    end
    if (params[:look][:shoes]).present?
      shoe_price = (Accessory.find(params[:look][:shoes] ).price )
    else
      shoe_price = 0
    end  
    total_price = n_price + shirt_price + shoe_price 
      
      if @look.save
        flash[:notice] = "look successfully created"
        @look.update_attributes(:price => total_price)
        redirect_to looks_path
      else
        render :action => 'new'
      end
    end

    def edit
      #raise params.inspect
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
    params.require(:look).permit(:name,:neckwear,:shirts,:shoes,:user_id,:product_id , :price)
   end
end