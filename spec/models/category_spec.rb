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
end