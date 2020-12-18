class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    new()
    timeline_posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    @timeline_posts ||= Post.where('user_id = ? or user_id in (?)', current_user.id,
                                   find_invitees_id).order(created_at: :desc)
  end

  def find_invitees_id
    Friendship.where('invitor_id=?', current_user.id).pluck('invitee_id')
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
