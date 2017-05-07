module SearchHelper
  extend ActiveSupport::Concern

  included do
    def self.search(search_string)
      where(fields(self), query: "%#{search_string}%")
    end

    def self.fields(model)
      search_fields = ''
      columns_hash = model.columns_hash

      columns_hash.select do |key, value|
        if value.type == :string
          search_fields += "#{key} ILIKE :query"
          search_fields += ' OR '
        end
      end

      search_fields[0...-4]
    end
  end
end
