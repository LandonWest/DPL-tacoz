class MenuItemsController < ApplicationController

  def index
    @items = MenuItem.all.page(params[:page]).per(8)
  end

  def show
    @item = MenuItem.find(params[:id])
  end

end
