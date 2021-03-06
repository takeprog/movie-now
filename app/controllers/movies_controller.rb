class MoviesController < ApplicationController
  before_action :search_movie, only: [:index, :search]
  before_action :authenticate_user!, except: [:index, :search]
  before_action :move_to_root,only: [:new, :create, :destroy]
  require 'themoviedb-api'
  Tmdb::Api.key(ENV["TMDB_API_KEY"])
  Tmdb::Api.language("ja")


  def index
    @movies = Movie.all
    @actor_tags=Tag.where.not(actor_tag: nil)
    @genre_tags=Tag.where.not(genre_tag: nil)
    @distribution_tags=Tag.where.not(distribution_site_tag: nil)
    @other_tags=Tag.where.not(other_tag: nil)
    @ranking=Movie.find(Like.group(:movie_id).order('count(movie_id) desc').limit(5).pluck(:movie_id))
    @add_movie=Movie.order('created_at desc').limit(5)
  end

  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.new(movie_params)
    actor_tag_list = params[:movie][:actor_tag].split(",")
    genre_tag_list = params[:movie][:genre_tag].split(",")
    distribution_tag_list = params[:movie][:distribution_site_tag].split(",")
    other_tag_list = params[:movie][:other_tag].split(",")
    @movie.actor_tags_save(actor_tag_list)
    @movie.genre_tags_save(genre_tag_list)
    @movie.distribution_tags_save(distribution_tag_list)
    @movie.other_tags_save(other_tag_list)
    if @movie.valid?
      @movie.save    
      return redirect_to root_path
    else
      render "new"
    end
  end

  def search
    @results=@p.result
  end

  def show
    @movie = Movie.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @good_comments = @movie.comments.where(genre_id: 2).includes(:user)
    @bad_comments = @movie.comments.where(genre_id: 3).includes(:user)
    @other_comments = @movie.comments.where(genre_id: 4).includes(:user)
    gon.movie=@movie

    gon.user=current_user.nickname
  end
  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to root_path
  end



  private

  def search_movie
    @p = Movie.ransack(params[:q])
  end


  def movie_params
    params.require(:movie).permit(:movie_name)
  end

  def move_to_root
    unless user_signed_in? && current_user.admin?
      redirect_to root_path
    end
  end
  

end
