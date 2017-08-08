class Group < ApplicationRecord
    has_many :user_groups
    has_many :users, through: :user_groups

    accepts_nested_attributes_for :users

    def users_attributes=(user_attrs)
        user_attrs[:user_ids].each do |user_attr|
            self.users << User.find(user_attr) unless user_attr.empty?
        end
    end
    
end
