class PostsController < ApplicationController
    def show
        @post = Post.find_by_slug!(params[:slug]) rescue not_found
    end

    def index
        @posts = Post.order(updated_at: :desc).all
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find_by_slug!(params[:slug]) rescue not_found
    end

    def update
        @post = Post.find_by_slug(params[:slug])

        if (@post.update(post_params))
            redirect_to @post
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def create
        @post = Post.new(post_params)
        if (@post.save)
            redirect_to @post
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find_by_slug(params[:slug])
        @post.destroy
    end

    private def post_params
        params.require(:post).permit(:title, :text)
    end
end
