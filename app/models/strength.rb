class Strength
	include Mongoid::Document
	field :pounds, type: Integer
  field :sets, type: Integer
 	field :reps, type: Integer

 	embedded_in :workout
end