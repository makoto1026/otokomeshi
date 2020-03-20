class Category < ApplicationRecord
  has_one :post
  has_ancestry
end