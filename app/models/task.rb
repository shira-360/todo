class Task < ApplicationRecord
    has_many :comments
    has_many :users, through: :tasks_users
end
