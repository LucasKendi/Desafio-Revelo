class PostsController < ApplicationController
    def show
        @post = Post.find_by_slug!(params[:slug]) rescue not_found
    end

    def index
        @post = Post.new
        @posts = Post.order(updated_at: :desc).all
    end

    def edit
        @post = Post.find_by_slug!(params[:slug]) rescue not_found
    end

    def update
        @post = Post.find_by_slug(params[:slug])

        if (@post.update(post_params))
            redirect_to @post
        else
            render json: @post.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        @post = Post.new(post_params)

        respond_to do |format|
            if @post.save
                format.js
            else
                format.json { render json: @post.errors.full_messages, status: :unprocessable_entity }
            end
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
