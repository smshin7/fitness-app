class CardioWorkout
  include Mongoid::Document
  field :type, type: String
  field :distance, type: Float
  field :time, type: Float
  field :day_of_week, type: String

  belongs_to :user
end
