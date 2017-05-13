import React from 'react';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';

export default ({ children }) => {
  return (
      <MuiThemeProvider>
        <div>
          {children}
        </div>
      </MuiThemeProvider>
  );
};
