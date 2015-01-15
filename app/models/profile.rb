class Profile
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :email, type: String
  field :height, type: Integer
  field :weight, type: Integer
  field :email, type: String
  field :location, type: String
  field :gym, type: String
  field :goal, type: String
end
