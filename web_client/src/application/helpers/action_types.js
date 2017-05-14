const actionValidator = {
  get(object, property) {
    if (object[property]) {
      return property;
    }

    throw new TypeError(`${property} is not a valid action type.`);
  }
};

export default actionTypes => {
  return new Proxy(Object.freeze(actionTypes), actionValidator);
};
