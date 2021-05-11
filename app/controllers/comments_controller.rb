class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment=Comment.create(comment_params)
    comment=@comment
    render json:{ comment: comment }
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :genre_id ).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end
