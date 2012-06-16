class Post < ActiveRecord::Base
  attr_accessible :body, :reply_to_id, :ip_address

  geocoded_by :ip_address do |obj,results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.city = geo.city
      obj.country = geo.country_code
    end
  end
  
  after_validation :geocode

  belongs_to :user


  has_many :replies, {:class_name => "Post", :foreign_key => "reply_to_id"}
  belongs_to :in_reply_to, {:class_name => "Post", :foreign_key => "reply_to_id"}

  validates :body, :length => 1..140, :presence => true

  has_many :mentions
  has_many :mentionings, :through => :mentions, :source => :user

  def ip_address
    @ip_address ||= nil
  end

  def ip_address=(ip)
    @ip_address = ip
  end

  serialize :tag_list
  before_save :generate_taglist


  private
  def generate_taglist
    self.tag_list = self.body.scan(/\B#(w*[A-Za-z0-9_]+w*)/).flatten
  end


end
