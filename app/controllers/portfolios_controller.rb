class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
  	@portfolio_item = Portfolio.new
  end

  def show
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio Item is nowlive.' }        
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title,:subtitle,:body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
     format.html { redirect_to portfolios_url, notice: 'The record was successfully removed.' }
	  end
  end

  private

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end