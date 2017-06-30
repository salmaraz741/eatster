class Place < ApplicationRecord
  belongs_to :user

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 2).order('id DESC')
    else
      paginate(page: page, per_page: 2).order('id DESC') 
    end
  end
end
