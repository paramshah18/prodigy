class ActivityCompletion < ApplicationRecord
  belongs_to :activity
  validates :day, inclusion: { in: (14..21).to_a }
end