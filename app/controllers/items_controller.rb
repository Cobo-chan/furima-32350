class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :find_item, only:[:show, :edit, :update, :destroy]
  before_action :move_to_index, only:[:edit, :update, :destroy]

  def index
    @item = Item.all.order('created_at DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end
  
  def edit
    
  end

  def update
    if @item.update(create_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    @item.image.purge
    redirect_to root_path
  end

  private
  def create_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :shipment_charge_id, :prefecture_id, :derivery_date_id, :selling_price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
  end
end
