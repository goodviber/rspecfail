class VideoCategory < ActiveRecord::Base
	belongs_to :video, foreign_key: :video_id
	belongs_to :category, foreign_key: :category_id
end