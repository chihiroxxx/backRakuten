class Book < ApplicationRecord
  belongs_to :user

  validates :booktitle,
    presence: true
  validates :thoughts,
    presence: true

end
