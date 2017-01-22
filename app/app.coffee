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
require('./components/games')
require('./components/note')
require('./components/notes')
require('./components/markdown')
require('./components/wishlist')

# Config
require('./config')
