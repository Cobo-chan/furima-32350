class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :move_to_index, only:[:edit]
  before_action :find_item, only:[:show, :edit, :update]

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

  private
  def create_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :shipment_charge_id, :prefecture_id, :derivery_date_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless current_user.id == item.user.id
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
