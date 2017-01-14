LoginController = ['$rootScope', '$http', ($rootScope, $http) ->
    init = () =>
        @loginError = loginError
        @loginSuccess = loginSuccess
        @login = login
        @logout = logout
        @checkLoggedIn = checkLoggedIn

        $rootScope.logged_in = false

        @error_message = null
        @user = {
          username: '',
          password: ''
        }

        @checkLoggedIn()
        return

    loginError = (res) =>
        @error_message = res.statusText
        @user.password = ''
        return

    loginSuccess = (res) =>
        $rootScope.logged_in = true

        @error_message = null
        @user.username = res.data
        @user.password = ''
        return

    login = () =>
        $http.post('/api/login', @user)
            .then(@loginSuccess, @loginError)
        return

    logout = () =>
        $rootScope.logged_in = false
        $http.delete('/api/login')
        return

    checkLoggedIn = () =>
        $http.get('/api/login')
            .then(@loginSuccess)
            .catch(() => {})

        return

    init()
    return
]

angular.module('mainApp')
    .controller('LoginController', LoginController)
