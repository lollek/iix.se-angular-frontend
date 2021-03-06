## Third party
require('jquery')
require('bootstrap-loader')
require('angular')
require('angular-resource')
require('angular-ui-router')
require('marked')
require('angular-marked')
require('ng-dialog')
require('../node_modules/ng-dialog/css/ngDialog.css')
require('../node_modules/ng-dialog/css/ngDialog-theme-default.css')

## mainApp
angular.module('mainApp', ['ui.router', 'ngResource', 'hc.marked', 'ngDialog'])

# Filters
require('./filters/reverse')
require('./filters/percentage')

# Resources
require('./resources/Beer')
require('./resources/Book')
require('./resources/Game')
require('./resources/MarkdownText')
require('./resources/Note')

# Controllers
require('./controllers/LoginController')

# Components
require('./components/beers')
require('./components/books')
require('./components/categories')
require('./components/games')
require('./components/loadingSpinner')
require('./components/markdown')
require('./components/note')
require('./components/notes')
require('./components/wishlist')
require('./components/thumbnails/bookThumbnail')
require('./components/thumbnails/categoryThumbnail')
require('./components/thumbnails/gameThumbnail')
require('./components/views/booksEditView')
require('./components/views/booksListView')

# Config
require('./config')
