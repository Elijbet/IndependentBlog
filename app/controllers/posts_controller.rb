class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :check_user, only: [:edit, :update, :destroy]

  before_filter :authenticate_user!
  before_action :tag_cloud


  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end

    @posts_popular = Post.order(cached_votes_up: :desc).limit(4)
    @post_most_popular = Post.order(cached_votes_up: :desc).limit(1)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id


    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post.downvote_by current_user
    redirect_to :back
  end

  def tag_cloud
    @tag = Post.tag_counts_on(:tags).order('count desc').limit(20)
  end

  def search
    if params[:search].present?
      @posts = Post.search(params[:search], page: params[:page], per_page: 5)
    else
      @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end
  end

  private

    def check_user
      unless (@post.user == current_user) 
        redirect_to root_url 
        flash[:alert] =  "Sorry, this review belongs to someone else"
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :name, :tag_list, :image)
    end
end
