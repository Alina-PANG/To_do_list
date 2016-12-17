class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  before_save :set_default
  validates :list_name, presence: true,
                        uniqueness: true

  protected
  def set_default
    self.list_num = 0
  end
end
