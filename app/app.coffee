## CSS
require('jquery')
require('bootstrap-loader')
require('./css/bootstrap_custom.css')

## Third party
require('angular')
require('angular-resource')
require('angular-ui-router')
require('marked')
require('angular-marked')

## mainApp
angular.module('mainApp', ['ui.router', 'ngResource', 'hc.marked'])

# Filters
require('./filters/reverse')

# Resources
require('./resources/Beer')
require('./resources/Book')
require('./resources/MarkdownText')
require('./resources/Note')

# Controllers
require('./controllers/BeersController')
require('./controllers/BooksController')
require('./controllers/MarkdownController')
require('./controllers/LoginController')

# Components
require('./components/note')
require('./components/notes')

# Config
require('./config')
