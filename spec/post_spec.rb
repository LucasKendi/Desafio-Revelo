require 'rails_helper'

RSpec.describe Post, type: :model do
    context "when creating post" do
        it "ensures title presence" do
            post = Post.new(text: 'texto').save

            expect(post).to eq(false)
        end

        it "ensures title presence" do
            post = Post.new(title: "", text: 'texto').save

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
    end
end