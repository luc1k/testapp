class Userpic < ActiveRecord::Base
  belongs_to :profile
  has_attachment :content_type => :image,
    :storage => :file_system,
    :max_size => 500.kilobytes,
    :resize_to => '100x100>',
    :thumbnails => {
    :large => '96x96>',
    :medium => '64x64>',
    :small => '48x48>'
  }
  validates_as_attachment
end
