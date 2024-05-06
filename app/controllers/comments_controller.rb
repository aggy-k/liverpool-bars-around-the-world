class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:replies]
  before_action :set_venue, only: [:new, :create]
  before_action :set_comment, only: [:replies, :reply, :upvote, :downvote]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.venue = @venue
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to venue_path(@venue) }
        format.turbo_stream
      end
    else
      render :new, status: 422
    end
  end

  def replies
  end

  def reply
    @parent = @comment
    @comment = Comment.new(parent_id: params[:id])
    @venue = @parent.venue
  end

  def upvote
    # FOR LATER
    @comment.upvote!
    redirect_back fallback_location: venue_path(@comment.venue)
  end

  def downvote
    # FOR LATER
    @comment.downvote!
    redirect_back fallback_location: venue_path(@comment.venue)
  end

  def render_votes_turbo_stream
    render(
      turbo_stream: [
        turbo_stream.replace(dom_id(@comment, :votes), @comment.votes)
      ]
    )
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
