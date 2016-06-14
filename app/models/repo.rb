class Repo < ActiveRecord::Base
    include PgSearch
    
    scope :sorted, ->{ order(stars: :asc) }
  pg_search_scope :search,
                  against: [
                    :title,
                    :language,
                    :username
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }
    
end
