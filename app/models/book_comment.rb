class BookComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :Book, optional: true

	validates :comment, presence: true
end
