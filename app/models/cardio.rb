class Cardio
	include Mongoid::Document
	include Mongoid::Timestamps
  field :type, type: String
  field :distance, type: Float
  field :time, type: Float

  embedded_in :workout
end