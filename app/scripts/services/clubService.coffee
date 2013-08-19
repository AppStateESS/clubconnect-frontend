'use strict'

angular.module('ClubConnectApp')
  .service 'clubService', ['$http', '$q', '$filter', ($http, $q, $filter) ->

    getAllClubs = (callback) ->
      $http
        .get('/json/clubs.json')
        .success (result) ->
          callback(result)

    clubSearch = (search) ->
      deferred = $q.defer()

      getAllClubs (result) ->
        deferred.resolve $filter('limitTo') $filter('filter')(result, search), 1

      return deferred.promise

    @getAllClubs = getAllClubs
    @clubSearch  = clubSearch
    undefined
  ]
