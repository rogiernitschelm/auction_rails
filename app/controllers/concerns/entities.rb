module Entities
  extend ActiveSupport::Concern

  included do
    class BaseEntity < Grape::Entity
      expose :entity_kind do |_|
        self.class.name.demodulize.sub(/Entity$/, '')
      end
    end

    def render_entity(entity, object, options = {})
      render json: entity.represent(object, options)
    end
  end
end
