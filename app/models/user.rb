class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :expertise, :tags, :presence => true, :if => :active_or_username?
  validates :username, :uniqueness => true, :if => :active_or_username?
  validates :mobile_number, :zipcode, :presence => true, :if => :active_or_mobile_number?
  validates :mobile_number, :phony_plausible => true, :if => :active_or_mobile_number?
  #phony_normalize :mobile_number, :as => :mobile_number_normalized, :default_country_code => 'US'

  has_many :conversations_as_expert, class_name: "Conversation",
                           foreign_key: "expert_id"
  has_many :conversations_as_pupil, class_name: "Conversation",
                           foreign_key: "pupil_id"

  def formatted_number
    mobile_number.phony_formatted(:normalize => :US, :format => :international, :spaces => '')
  end

  def conversations
    conversations_as_expert + conversations_as_pupil
  end

  def active?
    status == 'active'
  end

  def active_or_username?
    status.include?('username') || active?
  end

  def active_or_mobile_number?
    status.include?('mobile_number') || active?
  end

  def self.search(query)
    query = query.gsub("?","")
    query = query.gsub("!","")
    query = query.gsub(" ","|")
    where("tags @@ '#{query}'::tsquery")
  end
end
