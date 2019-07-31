require 'rails_helper'

RSpec.describe Post, type: :model do
    context "when creating post" do
        it "ensures title presence" do
            post = Post.new(text: 'texto').save

            expect(post).to eq(false)
        end
    end
end