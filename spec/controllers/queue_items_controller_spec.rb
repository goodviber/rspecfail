require 'spec_helper'
describe QueueItemsController do
	describe "GET index" do
		it "sets the @queue_items to the queue_items of the current user" do 
			alice = Fabricate(:user)
			session[:user_id] = alice.id
			queue_item1 = Fabricate(:queue_item, user:alice)
			queue_item2 = Fabricate(:queue_item, user:alice)
			get :index
			expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])			
		end
		
		it "redirects to sign in page for unauth users" do 
			get :index
			expect(response).to redirect_to sign_in_path
		end
	end
end
