class Workout
  include Mongoid::Document
  # include Mongoid::Timestamps
  field :day_of_week, type: String
  field :type, type: String
  field :distance, type: Float
  field :time, type: Float
  field :pounds, type: Integer
  field :sets, type: Integer
  field :reps, type: Integer

  belongs_to :user
end
