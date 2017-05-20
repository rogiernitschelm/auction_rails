import React from 'react';
import { Link } from 'react-router-dom';

export const Nav = ({ children, className = '' }) => {
  return (
    <nav className={`nav ${className}`}>
      {children}
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

export const Tabs = ({ children, className }) => {
  return (
    <div className="container">
      <div className={`tabs ${className}`}>
        <ul>
          {children}
        </ul>
      </div>
    </div>
  );
};

export const Tab = ({ isActive = '', children, to }) => {
  return (
    <li className={isActive ? 'is-active' : ''}>
      <Link to={to}>{children}</Link>
    </li>
  );
};
