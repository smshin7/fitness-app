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
  
  has_many :workouts

  has_secure_password

  validates :first_name, :last_name, :email, :age, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

end
