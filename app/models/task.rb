class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true
validates :imp, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
  before_save :set_default

  protected

  def set_default
    status ||= false
  end
end
