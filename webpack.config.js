// const path    = require("path")
// const webpack = require("webpack")

// module.exports = {
//   mode: "production",
//   devtool: "source-map",
//   entry: {
//     application: "./app/javascript/application.js"
//   },
//   output: {
//     filename: "[name].js",
//     sourceMapFilename: "[file].map",
//     path: path.resolve(__dirname, "app/assets/builds"),
//   },
//   plugins: [
//     new webpack.optimize.LimitChunkCountPlugin({
//       maxChunks: 1
//     })
//   ]
// }

const path = require("path");
const webpack = require("webpack");

module.exports = {
  mode: "development",
  devtool: "cheap-module-source-map",
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "application.js",
    path: path.resolve(__dirname, "public/packs"),
  },
  devServer: {
    writeToDisk: true,
    publicPath: "/packs/",
    host: "localhost",
    port: 3035,
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    })
  ]
};
