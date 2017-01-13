MarkdownController = ($location, MarkdownText) ->
    init = () =>
        @edit = edit
        @save = save
        @discard = discard

        @location = $location.path()
        @id = switch
            when @location == '/sofie' then 'sofie'
            else $location.path('/404')
        @content = MarkdownText.get({id: @id})
        @editing = false

    edit = () =>
        @editing = true
        return

    save = () =>
        @editing = false
        @content = MarkdownText.update({id: @id}, @content)
        return

    discard = () =>
        @editing = false
        @content = MarkdownText.get({id: @id})
        return

    init()
    return

MarkdownController
    .$inject = ['$location', 'MarkdownText']

angular.module('mainApp')
    .controller('MarkdownController', MarkdownController)
