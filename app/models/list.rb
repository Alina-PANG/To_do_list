class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :list_name, presence: true,
                        uniqueness: true


end
