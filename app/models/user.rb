class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :surname, type: String
  field :lastname, type: String
  field :email, type: String
  field :inn, type: String
  field :kpp, type: String
  field :customer, type: String
  field :address, type: String
  field :phone, type: String

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :inn, length: { is: 10 }, numericality: { only_integer: true }
  validates :kpp, length: { is: 9 }, numericality: { only_integer: true }, allow_blank: true
  validates :phone, format: { with: /\A\+?[0-9\-()\s]+\z/, message: "должен быть в правильном формате" }
end
