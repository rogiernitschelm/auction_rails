def generate_validation(model)
  attribute_validators = {}

  model.validators.each do |validator|
    validator.attributes.each do |attribute|
      attribute_validators[attribute] ||= []
      attribute_validators[attribute] << { kind: validator.kind, options: validator.options.dup }
    end
  end

  attribute_validators
end

namespace :rails_auctions do
  task validations: :environment do
    ActiveRecord::Base.connection
    models = [User]
    validations_hash = {}

    models.each do |model|
      model_name = model.name.camelize(:lower)
      validations_hash[model_name] = generate_validation(model)
    end

    file_path = Rails.root.to_s + '/web_client/src/customization/validations.json'

    File.open(file_path, 'w+') { |file| file.write(validations_hash.to_json) }

    puts 'Validation file generated.'
  end
end
