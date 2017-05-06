class Buyer < ApplicationRecord
  include SearchHelper

  belongs_to :user
  belongs_to :company
end
