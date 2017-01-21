LoginController = ['$rootScope', '$http', ($rootScope, $http) ->
    $rootScope.logged_in = false

    @error_message = null
    @user = {
      username: '',
      password: ''
    }

    @loginError = (res) =>
        @error_message = res.statusText
        @user.password = ''
        return

    @loginSuccess = (res) =>
        $rootScope.logged_in = true

        @error_message = null
        @user.username = res.data.username
        @user.password = ''
        return

    @login = () =>
        $http.post('/api/login', @user)
            .then(@loginSuccess, @loginError)
            .catch(@loginError)
        return

    @logout = () =>
        $rootScope.logged_in = false
        $http.delete('/api/login')
        return

    @checkLoggedIn = () =>
        $http.get('/api/login')
            .then(@loginSuccess)
            .catch(() => {})

        return

    @checkLoggedIn()
    return
]

angular.module('mainApp')
    .controller('LoginController', LoginController)
