class ItemsController < ApplicationController
  before_filter :require_signin!

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notices] = ["Item saved!"]
      redirect_to item_url(@item)
    else
      flash[:notices] = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notices] = ["Item edited!"]
      if request.referer == edit_item_url(@item)
        redirect_to @item
      else
        redirect_to request.referer
      end 
    else
      flash[:notices] = @item.errors.full_messages
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = current_user.items
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy 
    flash[:notices] = ["Item deleted"]
    redirect_to items_url
  end

  private

  def item_params
    params.require(:item).permit(:title, :url, :ttype, :private)
  end
end
