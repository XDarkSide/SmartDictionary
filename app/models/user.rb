class User < ApplicationRecord

    attribute :id, :integer
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :role_id, :integer
  
    validates :firstName, presence: true, length: { minimum: 2, maximum: 20 }
    validates :lastName, presence: true, length: { minimum: 2, maximum: 20 }
    validates :birthday, presence: true

  end