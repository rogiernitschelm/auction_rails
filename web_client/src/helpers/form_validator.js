import validations from 'customization/validations';
import camelCaseKeys from 'camelcase-keys';

const checkMinimumLength = (length, value) => value.length >= length;
const checkMaximumLength = (length, value) => value.length <= length;

const fieldValidator = (key, value, { kind, options }) => {
  if (!value && kind === 'presence') {
    return 'Deze waarde is verplicht';
  }

  if (!value) return;

  if (kind === 'length') {
    if (options.minimum) {
      const meetsRequirement = checkMinimumLength(options.minimum, value);

      if (!meetsRequirement) return 'Voldoet niet aan minimale lengte.';
    }

    if (options.maximum) {
      const meetsRequirement = checkMaximumLength(options.maximum, value);

      if (!meetsRequirement) return 'Voldoet niet aan maximale lengte.';
    }
  }

  return;
};

export const userFormValidator = values => {
  const userValidations = camelCaseKeys(validations.user);
  const errors = {};

  for (const key of Object.keys(userValidations)) {
    userValidations[key].forEach(fieldValidations => {
      const error = fieldValidator(key, values[key], fieldValidations);

      if (error) {
        errors[key] = error;
      }
    });
  }

  console.log(errors)
  return errors;
};
