class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie created successfully'
      redirect_to movies_path
    else
      flash.now[:alert] = 'Movie creation failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @movie.update(movie_params)
      flash[:notice] = 'Movie updated successfully'
      redirect_to movies_path
    else
      flash.now[:alert] = 'Movie update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    flash[:notice] = 'Movie destroyed successfully'
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :date_released, :country_of_origin, :showing_start, :showing_end)
  end
end
