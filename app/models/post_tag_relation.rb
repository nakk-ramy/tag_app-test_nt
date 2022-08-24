class PostTagRelation < ApplicationRecord
  belongs_to :post
  beloggs_to :tag
end
