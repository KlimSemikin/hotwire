class Note < ApplicationRecord
  belongs_to :user

  acts_as_list sequential_update: false

  validates_presence_of :title, :description
  validates :position, uniqueness: { scope: :user }
end
