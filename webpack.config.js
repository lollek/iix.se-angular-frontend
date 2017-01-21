const webpack = require('webpack');

module.exports = {
    entry: './app/app',
    output: {
        filename: 'bundle.js',
        path: './app/dist'
    },
    module: {
        loaders: [
            { test: /\.scss$/, loader: 'style-loader!css-loader!sass-loader!sass-resource-loader' },
            { test: /\.css$/, loader: 'style-loader!css-loader' },
            { test: /\.coffee$/, loader: 'babel-loader!coffee-loader' },
            { test: /\.js$/, loader: 'babel-loader', exclude: /node_modules/, query: { presets: ['es2015'] } },
            {
                test: /\.(ttf|eot|svg|woff(2)?)(\?[a-z0-9]+)?$/,
                loader: 'url-loader?limit=1024&publicPath=./dist/&name=fonts/[hash].[ext]'
            }

]
    },
    resolve: {
        extensions: ['.js', '.coffee']
    },
    plugins: [
        new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery"
        })
    ]
};