class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment=Comment.new(comment_params)
    if @comment.save
      redirect_to  movie_path(@comment.movie.id)
    else
      render "movie/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :genre_id ).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end
