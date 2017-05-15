import React from 'react';
import { Link } from 'react-router-dom';

export const Nav = ({ children, className = '' }) => {
  return (
    <nav className={`nav ${className}`}>
       <div className="container">
      {children}
      </div>
    </nav>
  );
};

export const NavItem = ({ children, className = '', onClick = () => {}, to = '/' }) => {
  return (
    <Link className={`nav-item ${className}`} to={to} onClick={onClick}>
      {children}
    </Link>
  );
};

export const NavLeft = ({ children, className = '' }) => {
  return (
    <div className={`nav-left ${className}`}>
      {children}
    </div>
  );
};

export const NavCenter = ({ children, className = '' }) => {
  return (
    <div className={`nav-center ${className}`}>
      {children}
    </div>
  );
};

export const NavRight = ({ children, className = '' }) => {
  return (
    <div className={`nav-right ${className}`}>
      {children}
    </div>
  );
};
