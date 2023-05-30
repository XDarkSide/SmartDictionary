class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :first_name, :string
  attribute :last_name, :string
  attribute :role_id, :integer
  attribute :password, :string
  attribute :password_confirmation, :string
  attribute :birthday, :date

  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :birthday, presence: true
end
