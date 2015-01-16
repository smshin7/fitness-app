class StrengthWorkout
  include Mongoid::Document
  field :type, type: String
  field :day_of_week, type: String
  field :pounds, type: Integer
  field :sets, type: Integer
  field :reps, type: Integer

  embedded_in :users, type: String
end