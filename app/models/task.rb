class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true
  validates :date, presence: true
  validates :imp, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
  before_save :set_default
  scope :completed, -> { where(completed: true) }
  scope :incompleted, -> { where(completed: false) }

  protected

  def set_default
    self.completed ||= false
  end
end
