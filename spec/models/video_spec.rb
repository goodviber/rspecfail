require 'spec_helper'

describe Video do
	
	it {should have_many(:categories).through(:video_categories)}

	describe "search_by_title" do 

		it "returns empty array if no match" do
			drwho = Video.create(title: "Dr Who", description: "Adventures of Time Lord")
			flash = Video.create(title: "Flash Gordon", description: "Flying Monkeys")
			expect(Video.search_by_title("hi there!")).to eq([])
		end


		it "returns array of one video for exact match" do
			drwho = Video.create(title: "Dr Who", description: "Adventures of Time Lord")
			flash = Video.create(title: "Flash Gordon", description: "Flying Monkeys")
			expect(Video.search_by_title("Dr Who")).to eq([drwho])
		end

		it "returns array of one video for partial match" do
			drwho = Video.create(title: "Dr Who", description: "Adventures of Time Lord")
			flash = Video.create(title: "Flash Gordon", description: "Flying Monkeys")
			expect(Video.search_by_title("Dr")).to eq([drwho])
		end

		it "returns array of all matches ordered by created_at" do 
			drwho = Video.create(title: "Dr Who", description: "Adventures of Time Lord", created_at: 1.day.ago)
			flash = Video.create(title: "Flash Gordon", description: "Flying Monkeys", created_at: 3.days.ago)
			monkey = Video.create(title: "Monkey", description: "Classic Martial art series", created_at: 2.days.ago)

			expect(Video.search_by_title("o")).to eq([drwho,monkey,flash])
		end
	end
end