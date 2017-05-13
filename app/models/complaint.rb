class Complaint < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
end
