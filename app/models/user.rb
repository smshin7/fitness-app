class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :age, type: Integer
  field :gender, type: String
  field :location, type: String
  field :goal, type: String
  field :password_digest, type: String
 
  # photo uploader using Carrierwave gem
  mount_uploader :profile_pic, ProfilePicUploader
  
  # relationship for workouts
  has_many :workouts

  has_secure_password

  # validations for user model
  validates :first_name, :last_name, :email, :age, :gender, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

end
