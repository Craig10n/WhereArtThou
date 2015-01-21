class Work < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :image, :styles => { :small => "200x200>", :medium => "300x300>", :large => "450x450>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..4.megabytes },
    :file_name => { :matches => [/png\Z/, /jpe?g\Z/]}
  do_not_validate_attachment_file_type :image
end
