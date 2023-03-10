class PostImagesController < ApplicationController

  def new# フォームの表示など、新規作成ページを表示する処理を実装
    @post_image = PostImage.new
  end


  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end


  def index# 投稿一覧を表示する処理を実装
    @post_images = PostImage.page(params[:page])
  end


  def show# 特定の投稿を表示する処理を実装
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end


  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end


  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
