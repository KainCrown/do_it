class Task < ActiveRecord::Base
  belongs_to :sprint
  scope :do, -> { where(state: 'do') }
  scope :in_progress, -> { where(state: 'in_progress') }
  scope :in_pr, -> { where(state: 'in_pr') }
  scope :done, -> { where(state: 'done') }
end
