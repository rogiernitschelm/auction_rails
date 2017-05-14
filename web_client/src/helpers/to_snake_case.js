export const toSnakeCase = string => {
  if (typeof string === 'string') {
    return string.replace(/([A-Z])/g, letter => `_${letter.toLowerCase()}`);
  }

  return string;
};
