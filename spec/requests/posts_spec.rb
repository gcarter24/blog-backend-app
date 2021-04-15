require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should return the posts index" do
      user = User.create!(name: "test", email: "test@email.com", password: "password")

      Post.create!(
        title: "example title 2", body: "example body 2", image: "example image 2", user_id: user.id,
      )
      Post.create!(
        title: "example title 1", body: "example body 1", image: "example image 1", user_id: user.id,
      )
      Post.create!(
        title: "example title 3", body: "example body 3", image: "example image 3", user_id: user.id,
      )

      get "/api/posts"
      posts = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(posts.length).to eq(3)
    end
  end
end
