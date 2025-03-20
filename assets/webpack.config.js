const path = require("path");
const glob = require("glob");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new TerserPlugin({
        terserOptions: {
          compress: {
            drop_console: true
          }
        }
      }),
      new CssMinimizerPlugin()
    ]
  },
  entry: {
    "./js/app.js": glob.sync("./vendor/**/*.js").concat(["./js/app.js"]),
    "./css/app.scss": "./css/app.scss"
  },
  output: {
    filename: "js/[name].js",
    path: path.resolve(__dirname, "../priv/static")
  },
  resolve: {
    extensions: [".js", ".jsx", ".json"],
    modules: ["node_modules", "deps"],
    alias: {
      phoenix_html: path.resolve(__dirname, "../deps/phoenix_html/priv/static/phoenix_html.js")
    }
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              sourceMap: true
            }
          },
          {
            loader: "sass-loader",
            options: {
              sourceMap: true
            }
          }
        ]
      },
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              sourceMap: true
            }
          }
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({ filename: "css/[name].css" }),
    new CopyWebpackPlugin({
      patterns: [{ from: "static/", to: "../" }]
    })
  ]
});
