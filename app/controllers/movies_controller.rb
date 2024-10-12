class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order('title ASC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = 'Movie created successfully' # Success message
      redirect_to movies_path
    else
      flash.now[:error] = 'There were errors with your submission.' # Validation errors
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @movie.update(movie_params)
      flash[:success] = 'Movie updated successfully' # Success message
      redirect_to movies_path
    else
      flash.now[:error] = 'There were errors with your submission.' # Validation errors
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = 'Movie destroyed successfully' # Success message
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :date_released, :country_of_origin, :showing_start, :showing_end)
  end
end