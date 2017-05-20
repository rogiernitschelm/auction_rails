export const UPDATE_ACCOUNT = 'UPDATE_ACCOUNT';
export const UPDATE_ACCOUNT_SUCCESS = 'UPDATE_ACCOUNT_SUCCESS';
export const UPDATE_ACCOUNT_FAILURE = 'UPDATE_ACCOUNT_FAILURE';

export const updateAccount = userInformation => {
  return {
    types: [UPDATE_ACCOUNT, UPDATE_ACCOUNT_SUCCESS, UPDATE_ACCOUNT_FAILURE],
    promise: {
      method: 'put',
      path: `users/${userInformation.id}`,
      root: 'api',
      params: userInformation
    }
  };
};
