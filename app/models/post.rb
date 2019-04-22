class Post < ApplicationRecord
  validates :title, presence: true
  validates :body,  presence: true

  validates_presence_of :title, :friendly_id

  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  has_many :comments

  before_validation :generate_friendly_id, :on => :create

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  belongs_to :category, :optional => true

    def to_param
     self.friendly_id
    end

   protected

   def generate_friendly_id
     self.friendly_id ||= SecureRandom.uuid
   end
end
