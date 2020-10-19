class PostsController < ApplicationController
    before_action :ensure_logged_in, only: [:new, :create, :destroy, :edit, :update]
    before_action :ensure_author, only: [:edit, :update, :destroy]

    def ensure_author
        @post = Post.find(params[:id])
        if @post.author_id != current_user.id
            flash[:errors] = ["You are not the author"]
            redirect_to subs_url
        end
    end

    def new
        @post = Post.new
        @subs = Sub.all
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            @subs = Sub.all
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def destroy
        @post.destroy
        redirect_to posts_url
    end

    def edit #returns html
        render :edit
    end

    def update #saves it to the db
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end
    
end
