class MoviesController < ApplicationController

  # @return [Object]
  def index
    @movies = Movie.all
  end

  def new
    @movies = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(whitelisted_params)
    respond_to do |format|
      if @movie.save
        format.html  { redirect_to(@movie,
                                   :notice => 'Movie was successfully created.') }
        format.json  { render :json => @movie,
                              :status => :created, :location => @movie }
      else
        format.html  { redirect_to :action => "new" }
        format.json  { render :json => @movie.errors.to_json,
                              :status => :unprocessable_entity }
      end
    end
  end

  def whitelisted_params
    params.require(:movie).permit(:title, :description, :rating, :category_id)
  end


end