class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :age, type: Integer
  field :gender, type: String
  field :height, type: Integer
  field :weight, type: Integer
  field :location, type: String
  field :gym, type: String
  field :goal, type: String
  field :password_digest, type: String
  has_many :cardio_workouts
  accepts_nested_attributes_for :cardio_workouts
  has_many :strength_workouts
  accepts_nested_attributes_for :strength_workouts

  has_secure_password

  validates :first_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

end
