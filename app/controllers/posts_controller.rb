class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def new
    end

    def create
        @post = Post.new(post_params)
        if(@post.save)
            redirect_to @post
        else
            render 'new'
        end
    end

    private def post_params
        params.require(:post).permit(:title, :text)
    end
end
