class Link < ApplicationRecord
  validates :given_url, presence: true
end
