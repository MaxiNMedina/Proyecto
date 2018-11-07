class User < ApplicationRecord
  #many to many relation with auctions
  has_many :created_auctions, class_name: "Auction", foreign_key: :user_id
  has_and_belongs_to_many :auctions
end
