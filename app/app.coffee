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

# Resources
require('./resources/Beer')
require('./resources/Book')
require('./resources/MarkdownText')
require('./resources/Note')

# Controllers
require('./controllers/MarkdownController')
require('./controllers/LoginController')

# Components
require('./components/beers')
require('./components/books')
require('./components/note')
require('./components/notes')
require('./components/wishlist')

# Config
require('./config')
