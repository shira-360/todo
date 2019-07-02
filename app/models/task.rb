class Task < ApplicationRecord
    has_many :comments
    has_many :tasks_users
    has_many :users, through: :tasks_users
    
end
