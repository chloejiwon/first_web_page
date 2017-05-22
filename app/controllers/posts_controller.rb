class PostsController < ApplicationController

  # 모든 게시글들을 보여주는 액션
  def index
    @posts = Post.all
  end

  # 게시글을 새로 만드는 액션
  def create
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    
    @post.user_id = params[:id]
    
    @post.img_url = params[:pic]
    
    
    @hashtag = params[:hashtags].split(",")
    
    @hashtag.each do |onetag|
      tag = Hashtag.find_or_create_by(name:onetag)
      #tag = Hashtag.new
      #tag.name = onetag
      # tag.save
      
      
      # Hashtag.find(1)
      # Hashtag.find_by(name:params[:name]) 하나만 뽑느다.
      # Hashtag.find_by_name(params[:name]) 
      # Hashtag.where(name:params[:name]) 그ㅡ 이름인 것 다뽑느다.
      
      
      @post.hashtags << tag
    end
    
    @post.save
    redirect_to :back
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end
  
  def find
    if Hashtag.find_by_name(params[:find_hash]) == nil
      @posts = []
    else
    @posts = Hashtag.find_by_name(params[:find_hash]).posts.all
    end
    #redirect_to :back
  end
  
  def mypost
    @posts = Post.where('user_id':current_user.id)
  end
  
  def show
    @post=Post.find_by_id(params[:id])
    #@post = Post.where('user_id':current_user.id)
    
    if @post.blank?
      flash[:error] = params[:id] + 'The Post not found in the database'
      redirect_to root_path 
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    
    @post.user_id = current_user.id
    
    @hashtag = params[:hashtags].split(",")
    
    @hashtag.each do |onetag|
      tag = Hashtag.find_or_create_by(name:onetag)
      #tag = Hashtag.new
      #tag.name = onetag
      # tag.save
      
      
      # Hashtag.find(1)
      # Hashtag.find_by(name:params[:name]) 하나만 뽑느다.
      # Hashtag.find_by_name(params[:name]) 
      # Hashtag.where(name:params[:name]) 그ㅡ 이름인 것 다뽑느다.
      
      
      @post.hashtags << tag
    end
    
    @post.save
    
    redirect_to "/posts"
  end
  

end
