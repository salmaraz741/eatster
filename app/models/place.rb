class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  has_many :comments, :dependent => :delete_all
  has_many :memberships, :dependent => :delete_all
  validates :name, :length => { minimum:4 },:presence => true
  validates :address, :length => { minimum:4 },:presence => true
  validates :description, :presence => true
end

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 2).order('id DESC')
    else
      paginate(page: page, per_page: 2).order('id DESC') 
    end
  end

