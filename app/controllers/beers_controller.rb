class BeersController < ApplicationController
  before_action :auth!, only: [:new, :edit, :create, :update, :destroy]

  def index
    render json: Beer.all
  end

  def show
    render json: Beer.find(params[:id])
  end

  def new
    render json: Beer.new
  end

  def edit
    render json: Beer.find(params[:id])
  end

  def create
    beer = Beer.new(beer_params)
    beer.save
    render json: beer
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
    params.require(:beer).permit(:name, :brewery, :percentage, :country, :type, :sscore, :oscore)
  end
end
