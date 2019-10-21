# frozen_string_literal: true

class MoviesController < ApplicationController
  # @return [Object]
  def index
    @movies = Movie.includes(:category).order(:title).page params[:page]
  end

  def new
    @movie = Movie.new
  end

  def search
    search_param = params.permit(:search, :page)
    @movies = Movie.search(search_param[:search], search_param[:page])
  rescue NoMethodError
    redirect_to(root_path, alert: "Empty field!")
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(whitelisted_params)
    respond_to do |format|
      if @movie.save!
        format.html do
          redirect_to(@movie,
                      notice: 'Movie was successfully created.')
        end
        format.json do
          render json: @movie,
                 status: :created, location: @movie
        end
      else
        format.html  { redirect_to action: 'new' }
        format.json  do
          render json: @movie.errors.to_json,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def whitelisted_params
    # params.require(:movie).permit(:title, :description, :rating, :category_id)
  end
end
