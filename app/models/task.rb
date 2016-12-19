class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true
  before_save :set_default
  attr_accessor :status

  protected
  def set_default
    self.status = false
  end
end
