const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: {
     app: './src/index'
  },
  output: {
    path: path.join(__dirname, 'dist'),
    publicPath: '/dist',
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.(jpe?g|png|gif|svg)$/,
        use: [
          {
            loader: 'url-loader',
            options: { limit: 40000 }
          },
          {
            loader: 'image-webpack-loader',
            options: { bypassOnDebug: true }
          }
        ]
      },
      {
        test: /\.js$/,
        loader: 'babel-loader',
        include: path.join(__dirname, 'src')
      },
      {
        test: /\.json$/,
        loader: 'json-loader'
      },
      {
        test: /\.scss$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      }
    ]
  },
  resolve: {
    alias: {
      assets: path.resolve(__dirname, 'src', 'assets'),
      authentication: path.resolve(__dirname, 'src', 'application', 'authentication'),
      common: path.resolve(__dirname, 'src', 'application', 'common'),
      helpers: path.resolve(__dirname, 'src', 'helpers'),
      customization: path.resolve(__dirname, 'src', 'customization')
    }
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NamedModulesPlugin()
  ],
  devServer: {
    compress: true,
    port: 8080,
    hot: true
  },
  externals: {
    config: JSON.stringify(
      {
        sessions: 'http://localhost:5100/sessions',
        api: 'http://localhost:5100/api',
        admin: 'http://localhost:5100/admin'
      }
    )
  },
};
