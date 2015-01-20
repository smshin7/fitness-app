class Cardio
	include Mongoid::Document
  field :type, type: String
  field :distance, type: Float
  field :time, type: Float

  embedded_in :workout
end