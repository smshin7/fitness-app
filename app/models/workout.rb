class Workout
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :lift, type: String
  field :weight, type: Integer
  field :set, type: Integer
  field :reps, type: Integer

  # embeds_many :cardio
  # embeds_many :strength
  # accepts_nested_attributes_for :cardio
  # accepts_nested_attributes_for :strength

  belongs_to :user
end
