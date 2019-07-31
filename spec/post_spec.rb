require 'rails_helper'

RSpec.describe Post, type: :model do
    context "when creating post" do
        it "ensures title presence" do
            post = Post.new(text: 'texto').save

            expect(post).to eq(false)
        end

        it "ensures text presence" do
            post = Post.new(title: 'titulo').save

            expect(post).to eq(false)
        end

        it "should save successfully" do
            post = Post.new(title: 'titulo', text: 'texto').save

            expect(post).to eq(true)
        end

        it "ensures slug is correct" do
            post = Post.new(title: 'Cartão de cŕedito', text: 'texto')
            post.save

            expect(post).to have_attributes(:slug => "cartao-de-credito")
        end

    end
end