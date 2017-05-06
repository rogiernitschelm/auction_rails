module SearchHelper
  extend ActiveSupport::Concern

  included do
    def self.search(query)
      where(search_query(self), query: "%#{query}%")
    end

    def self.search_query(model)
      search_query = ''
      columns_hash = model.columns_hash

      columns_hash.select do |key, value|
        if value.type == :string
          search_query += "#{key} ILIKE :query"
          search_query += ' OR '
        end
      end

      search_query[0...-4]
    end
  end
end
