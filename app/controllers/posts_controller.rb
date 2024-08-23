class PostsController < ApplicationController
  before_action :set_post, only: %i[ edit update destroy ]
  before_action :redirect_to_index, only: %i[ new edit ]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      flash.now[:notice] = "#{@post.id}の新規作成に成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash.now[:notice] = "#{@post.id}の更新に成功"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    if @post.destroy
      flash.now[:notice] = "#{@post.id}の削除に成功"
    else
      flash.now[:alert] = "#{@post.id}の削除に失敗"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title)
    end

    def redirect_to_index
      if !request.format.turbo_stream? && !turbo_frame_request?
        redirect_to posts_url
      end
    end
end
