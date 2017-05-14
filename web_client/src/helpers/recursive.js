const checkForCallback = callback => {
  if (!callback || typeof callback !== 'function') {
    throw Error(
      `
      This awesome function requires a callback as a second argument.
      You gave me the following value: ${callback}
      `
    );
  }
};

export const recuriveArrayModification = (array, callback) => {
  checkForCallback(callback);

  return array.map(arr => {
    if (Array.isArray(arr)) {
      return recuriveArrayModification(arr, callback);
    }

    return callback(arr);
  });
};

export const recursiveObjectModification = (object, callback) => {
  checkForCallback(callback);
  const newObject = object;

  for (const key of Object.keys(object)) {
    if (typeof object[key] === 'object' && object[key] !== null) {
      recursiveObjectModification(object[key], callback);
    } else {
      newObject[key] = callback(object[key]);
    }
  }
  return newObject;
};

export const recursive = (props, callback) => {
  checkForCallback(callback);

  if (Array.isArray(props)) {
    return recuriveArrayModification(props, callback);
  }

  if (typeof props === 'object') {
    return recursiveObjectModification(props, callback);
  }

  throw Error('An array or object should be passed in as a first argument.');
};
