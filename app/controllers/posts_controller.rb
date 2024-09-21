class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice_create] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:notice_no_create] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice_update] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:notice_no_update] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notide_destroy] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(:title, :start_date, :end_date, :in_all_day, :memo)
  end
end
