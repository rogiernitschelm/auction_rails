import React from 'react';
import { Field } from 'redux-form';

export const renderField = props => {
  const {
    label,
    type,
    name,
    input,
    placeholder,
    autoFocus,
    options = {},
    meta: {
      error,
      touched
    }
  } = props;

  if (type === 'select') {
    const renderOptions = () => options.map(option => {
      const { value, text } = option;
      return (
        <option key={value} value={value}>{text}</option>
      );
    });

    return (
      <div className="field">
        <label className="label" htmlFor={label}>{label}</label>
        <p className="control">
          <span className="select">
            <select {...input}>
              {renderOptions()}
            </select>
          </span>
        </p>
      </div>
    );
  }

  return (
    <div className="field">
      <label className="label" htmlFor={label}>{label}</label>
      <p className="control">
        <input
          {...input}
          className="input"
          autoFocus={autoFocus}
          name={name}
          placeholder={placeholder}
          type={type}
        />
      </p>
      {touched && error && <p className="help is-danger">{error}</p>}
    </div>
  );
};

export const Input = ({ name, type, label, placeholder, options, autoFocus }) => {
  return (
    <Field
      autoFocus={autoFocus}
      component={renderField}
      label={label}
      name={name}
      options={options}
      placeholder={placeholder}
      type={type}
    />
  );
};

export const Form = props => {
  const {
    children,
    error = '',
    onSubmit,
    submit = 'Submit',
    title,
  } = props;

  const renderError = () => {
    if (error) {
      return (
        <div className="notification is-danger">
          {error}
        </div>
      );
    }
  };

  return (
    <div className="container">
      <div className="columns is-vcentered">
        <div className="column is-6 is-offset-3">
          <h2 className="subtitle is-2">
            {title}
          </h2>
          <div className="box form-box">
            <form className="control" onSubmit={onSubmit}>
              {renderError()}

              {children}
              <button className="button is-primary">
                {submit}
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};
