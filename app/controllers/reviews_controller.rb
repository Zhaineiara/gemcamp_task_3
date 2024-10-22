class ReviewsController < ApplicationController
  before_action :find_movie
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_path(@movie.slug)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to movie_path(@movie.slug), notice: 'Review was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to movie_path(@movie.slug), notice: 'Review was successfully deleted.'
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_movie
    @movie = Movie.find_by(slug: params[:movie_slug   ]) || Movie.find_by(params[:id])
  end

  def find_review
    @review = @movie.reviews.find(params[:id])
  end
end
