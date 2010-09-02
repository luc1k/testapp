class Post < ActiveRecord::Base
  validates_presence_of :name, :body
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 6
  has_many :comments, :dependent => :destroy
  has_many :tags,  :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :comments, :allow_destroy => :true, :reject_if => :all_blank
  accepts_nested_attributes_for :tags, :allow_destroy => :true , :reject_if => :all_blank
  
 def self.find_posts(page)
   find(:all, { :order => "id DESC", :limit => 10, :offset => page*10 })  
 end
end
