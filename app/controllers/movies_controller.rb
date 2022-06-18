class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      flash[:notice] = "Movie created Successfully"
      redirect_to movies_path
    else
      render 'new'
    end

  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:notice] = "Movie Updated Successfully."
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: "Movie destroyed Successfully."
  end

private

  def movie_params
    params.require(:movie).permit(:title, :description, :director, :rating, :movie_length, :image)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
