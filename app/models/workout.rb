class Workout
  include Mongoid::Document
  # include Mongoid::Timestamps
  field :day_of_week, type: String
  embeds_many :cardio
  embeds_many :strength

  belongs_to :user
end
