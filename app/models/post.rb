class Post < ApplicationRecord
  belongs_to :user

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  
  mount_uploader :image, ImageUploader

  acts_as_votable

  searchkick
  
end
