require 'spec_helper'

describe Video do
	it "saves itself" do
		video = Video.new(title: "monk", description: "a great video!")
		video.save
		expect(Video.first).to eq(video)
	end
	it {should have_many(:categories).through(:video_categories)}

	it "does not save a video without a title" do
		video = Video.create(description: "test video")
		expect(Video.count).to eq(0)
	end

	it "does not save a video without a description" do
	video = Video.create(title: "another test video")
		expect(Video.count).to eq(0)
	end
end