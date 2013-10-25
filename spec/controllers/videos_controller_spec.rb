require 'spec_helper'

describe VideosController do
	describe "GET show" do
		context "with authenticated users" do
			before do
				session[:user_id] = Fabricate(:user).id
			end

			it "sets @video" do
				video = Fabricate(:video)
				get :show, id: video.id
				expect(assigns(:video)).to eq(video)
			end

			it "sets @reviews" do
				video = Fabricate(:video)
				review1 = Fabricate(:review, video: video)
				review2 = Fabricate(:review, video: video)
				get :show, id: video.id
				expect(assigns(:reviews)).to match_array([review1, review2])
			end

			it "renders the show template" do
				video = Fabricate(:video)
				get :show, id: video.id
				expect(response).to render_template :show
			end
		end

		context "with unauthenticated user" do
			it "redirects to sign in page" do
				video = Fabricate(:video)
				get :show, id: video.id
				expect(response).to redirect_to sign_in_path
			end
		end
	end

	describe "POST search" do
		it "sets @results for authenticated user" do
			session[:user_id] = Fabricate(:user).id
			futurama = Fabricate(:video, title: "Futurama")
			post :search, search_term: "rama"
			expect(assigns(:results)).to eq([futurama])
		end

		it "redirects to sign in page for unauthenticated user" do
			futurama = Fabricate(:video, title: "Futurama")
			post :search, search_term: "rama"
			expect(response).to redirect_to sign_in_path
		end
	end
end