## CSS
require('jquery');
require('bootstrap-loader');
require('./css/bootstrap_custom.css');

## Third party
require('angular');
require('angular-resource');
require('angular-ui-router');

## mainApp
angular.module('mainApp', ['ui.router'])

# Filters
require('./filters/reverse')

# Resources
require('./resources/Beer')
require('./resources/Book')
require('./resources/MarkdownText')
require('./resources/Note')

# Controllers
require('./controllers/BeersController');
require('./controllers/BooksController');
require('./controllers/MarkdownController');
require('./controllers/UserController');

# Components
require('./components/note');
require('./components/notes');

# Config
require('./config');
