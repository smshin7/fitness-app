class Workout
  include Mongoid::Document
  include Mongoid::Timestamps
  field :workout_type, type: String
  field :lift, type: String
  field :weight, type: Integer
  field :set_count, type: Integer
  field :rep, type: Integer

  # embeds_many :cardio
  # accepts_nested_attributes_for :cardio
  # embeds_many :strength
  # accepts_nested_attributes_for :strength

  belongs_to :user

  #validations for workout model
  validates :workout_type, presence: true
  validates :lift, presence: true
  validates :set_count, presence: true
  validates :rep, presence: true

end
