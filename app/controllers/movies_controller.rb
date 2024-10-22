class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order('title ASC')

    if params[:genre].present?
      @movies = @movies.joins(:genres).where(genres: { name: params[:genre] })
    end

    if params[:search].present?
      @movies = @movies.where("title LIKE :query OR description LIKE :query", query: "%#{params[:search]}%")
    end

    @movies = @movies.order('title ASC').page(params[:page]).per(4)
    session.delete(:last_movies_page) if params[:page].blank?
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

  def show
    @movie = Movie.find_by(slug: params[:slug])
    @current_page = params[:page]
    session[:last_movies_page] = params[:page].present? ? params[:page].to_i : 1
    session[:last_movies_genre] = params[:genre]
    session[:last_movies_search] = params[:search]
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      puts params[:movie]
      flash[:success] = 'Movie updated successfully'
      redirect_to movie_path(@movie.slug)
    else
      flash.now[:error] = 'There were errors with your submission.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = 'Movie destroyed successfully'
    redirect_to root_path
  end

  private

  def find_movie
    @movie = Movie.find_by(slug: params[:slug]) ||  Movie.find_by(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :date_released, :country_of_origin, :showing_start, :showing_end, genre_ids:[])
  end
end