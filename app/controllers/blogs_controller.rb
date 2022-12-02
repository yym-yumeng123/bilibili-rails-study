class BlogsController < ApplicationController
  before_action :auth_user, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def create
    @blog = current_user.blogs.new blog_attrs

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
  

  def destroy
  end

  def update
  end

  def new
    @blog = Blog.new
  end


  


  private
  # , :is_public, :tags_string
  def blog_attrs
    params.require(:blog).permit(:title, :content)
  end
end
