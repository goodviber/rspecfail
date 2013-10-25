require 'spec_helper'
 describe ReviewsController do
 	describe "POST create" do
 		context "with authenticated users" do
 			context "with valid inputs" do
 				it "creates a review" do
	 				video = Fabricate(:video)
	 				post :create, Fabricate.attributes_for(:review), video_id: video_id
	 				expect(Review.count).to eq(1)
	 			end
 				it "creates a review associated with the video"
 				it "creates a review associated with the signed in user"
 				it "redirects to the video show page"
 			end
 			context "with valid inputs"
 		end
 		context "with unauthenticated users"
 end
end