class BlogsController < ApplicationController
  before_action :auth_user, except: [:index, :show]

  def index
    @blogs = Blog.all.includes(:tags, :user)
  end

  def create
    @blog = current_user.blogs.new blog_attrs

    # Blog.transaction do
      # @blog.save!
      # tag...
    # end

    if @blog.save
      flash[:notice] = '博客创建成功'
      redirect_to blogs_path
    else
      flash[:notice] = '博客创建失败'
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
    render action: :new
    
  end
  
  

  def destroy
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.attributes = blog_attrs
    if @blog.save 
      @blog.tags.destroy_all
      flash[:notice] = '博客更新成功'
      redirect_to blogs_path
    else
      flash[:notice] = '博客更新失败'
      render :new
    end
  end

  def new
    @blog = Blog.new
  end


  


  private
  # , :is_public, :tags_string
  def blog_attrs
    params.require(:blog).permit(:title, :content, :is_public, :tags_string)
  end
end
