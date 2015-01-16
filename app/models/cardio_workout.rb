class CardioWorkout
  include Mongoid::Document
  field :type, type: String
  field :distance, type: Float
  field :time, type: Float
  field :day_of_week, type: String

  embedded_in :users, type: String
end
