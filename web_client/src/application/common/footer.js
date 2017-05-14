import React from 'react';

export const Footer = ({ children, className }) => {
  return (
    <footer className={`footer ${className}`}>
      <div className="container">
        <div className="content has-text-centered">
          {children}
        </div>
      </div>
    </footer>
  );
};
