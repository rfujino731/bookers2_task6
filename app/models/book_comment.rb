class BookComment < ApplicationRecord
	belongs_to :user
	belongs_to :Book

	validates :body, presence: true
end
