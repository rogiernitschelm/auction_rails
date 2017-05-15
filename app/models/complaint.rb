class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: :target_user_id

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
end
