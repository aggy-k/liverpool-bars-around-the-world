class CommentsController < ApplicationController
  before_action :set_venue, only: [:new, :create]
  before_action :set_comment, only: [:replies]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.venue = @venue
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end

  def replies

  end

  private
    def set_venue
      @venue = Venue.find_by(slug: params[:venue_slug])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :venue_id, :parent_id)
    end
end
