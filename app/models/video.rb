class Video <ActiveRecord::Base
	has_many :video_categories
	has_many :categories, through: :video_categories
	has_many :reviews
	validates :title, presence: true
	validates :description, presence: true

	def self.search_by_title(search_term)
		where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
	end
end