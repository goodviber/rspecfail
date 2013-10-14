require 'spec_helper'

describe Category do
	it "saves itself" do
		category = Category.new(name:"Foreign")
		category.save
		expect(Category.first).to eq(category)
	end

	it "has many videos" do
		comedies = Category.create(name:"comedies")
		south_park = Video.create(title: "South Park", description: "funny cartoon video")
		futurama = Video.create(title: "Futurama", description: "simpsons in space")

			videos = Video.all
			videos.each do |v|
				v.categories.each do |video_category|
					expect(video_category.name).to include(comedies)
				end
			end
	end

	describe "#recent_videos" do
			it "returns videos in chronological order by created at" do
				comedies = Category.create(name: "comedies")
				futurama = Video.create(title: "Futurama", description: "cartoon", created_at: 1.day.ago)
				south_park = Video.create(title: "South Park", description: "another cartoon", created_at: 2.days.ago)

				video = Video.all
				comedies.videos << video
				expect(comedies.videos).to eq([futurama, south_park])
			end

				it "returns all videos if there are less than 6 videos" do
					comedies = Category.create(name: "comedies")
					futurama = Video.create(title: "Futurama", description: "cartoon", created_at: 1.day.ago)
					south_park = Video.create(title: "South Park", description: "another cartoon", created_at: 2.days.ago)

					video = Video.all
					comedies.videos << video
					expect(comedies.recent_videos.count).to eq(2)
				end

				it "returns 6 videos if there are more than 6 videos" do
					comedies = Category.create(name: "comedies")
					7.times { Video.create(title: "foo", description: "more foo")}
					video = Video.all
					comedies.videos << video
					expect(comedies.recent_videos.count).to eq(6)
				end

				it "returns the 6 most recent videos" do
					comedies = Category.create(name: "comedies")
					6.times { Video.create(title: "foo", description: "more foo")}
					tonight = Video.create(title: "tonight", description: "current affairs", created_at: 3.days.ago)
					video = Video.all
					comedies.videos << video
					expect(comedies.recent_videos).not_to include([tonight])
				end

				it "returns an empty array if the category does not have any videos" do
					comedies = Category.create(name: "comedies")
					video = Video.all
					comedies.videos << video
					expect(comedies.recent_videos).to eq([])
				end
	end
end