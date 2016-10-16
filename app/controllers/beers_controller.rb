class BeersController < ApplicationController
  before_action :auth!, only: [:create, :update, :destroy]

  def index
    render json: Beer.all
  end

  def show
    render json: Beer.find(params[:id])
  end

  def create
    render json: Beer.create(beer_params)
  end

  def update
    beer = Beer.find(params[:id])
    beer.update(beer_params)
    render json: beer
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy
    render json: beer
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :brewery, :percentage, :country, :style, :sscore, :oscore)
  end
end
