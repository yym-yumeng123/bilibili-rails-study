class BlogsController < ApplicationController
  before_action :auth_user, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def create
    @blog = current_user.blogs.new blog_attrs

    if @blog.save
      update_tags
      
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
      update_tags
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
    params.require(:blog).permit(:title, :content, :is_public)
  end

  def update_tags
    params[:tags].split(',').each do |tag|
      # 查找标签
      one_tag = Tag.find_by(title: tag)
      one_tag = Tag.new title: tag unless one_tag
      # 追加操作符, 如果未保存, 自动帮忙保存
      @blog.tags << one_tag
    end    
  end
  
end
