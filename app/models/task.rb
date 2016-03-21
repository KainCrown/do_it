class Task < ActiveRecord::Base
  scope :do, -> { where(state: 'do') }
  scope :in_progress, -> { where(state: 'in_progress') }
  scope :in_pr, -> { where(state: 'in_pr') }
  scope :done, -> { where(state: 'done') }
end
