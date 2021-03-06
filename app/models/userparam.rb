class Userparam < ApplicationRecord
	belongs_to :user

	validates :nickname, :firstname, :lastname, presence: true

    validates :phone,
               uniqueness: true,
               length: { is: 13 },
               format: {with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/}
end
