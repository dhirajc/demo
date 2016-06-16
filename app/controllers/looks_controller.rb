class LooksController < ApplicationController

before_filter :authorize_user
  
  def authorize_user
    return unless !current_user.present?
      redirect_to new_user_session_path, alert: 'Please sign in to create your look'
  end

  def index
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
        # binding.pry
        
        nw = @look.neckwear
        nw = Accessory.find(nw)
        nw.update_attributes(:quantity => nw.quantity.to_i - 1 )

        sh = @look.shirts
        sh = Accessory.find(sh)
        sh.update_attributes(:quantity => sh.quantity.to_i - 1 )

        so = @look.shoes
        so = Accessory.find(so)
        so.update_attributes(:quantity => so.quantity.to_i - 1 )

        flash[:notice] = "Look successfully created"
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
      nw = @look.neckwear
      nw = Accessory.find(nw)
      nw.update_attributes(:quantity => nw.quantity.to_i + 1 )

      sh = @look.shirts
      sh = Accessory.find(sh)
      sh.update_attributes(:quantity => sh.quantity.to_i + 1 )

      so = @look.shoes
      so = Accessory.find(so)
      so.update_attributes(:quantity => so.quantity.to_i + 1 )
    @look.destroy
    flash[:notice] = "Look successfully destroyed"
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