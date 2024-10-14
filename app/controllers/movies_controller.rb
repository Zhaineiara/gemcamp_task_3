class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    if params[:genre].present?
      @movies = Movie.joins(:genres).where(genres: { name: params[:genre] }).order('movies.title ASC')
    else
      @movies = Movie.all.order('title ASC') # Order all movies alphabetically
    end
  end

  def new
    @movie = current_user.movies.build
    @genres = Genre.all.map{|g| [g.name, g.id]}
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      flash[:success] = 'Movie created successfully'
      redirect_to movies_path
    else
      flash.now[:error] = 'There were errors with your submission.'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @movie.update(movie_params)
      flash[:success] = 'Movie updated successfully'
      redirect_to movies_path
    else
      flash.now[:error] = 'There were errors with your submission.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = 'Movie destroyed successfully'
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :date_released, :country_of_origin, :showing_start, :showing_end, genre_ids:[])
  end
end