'use strict'

angular.module('ClubConnectApp')
  .service 'clubService', ['$http', '$q', '$filter', ($http, $q, $filter) ->

    baseUrl = 'https://r6test.ess.appstate.edu/sdr173/api.php?callback=JSON_CALLBACK&type=club'
    searchUrl = baseUrl + '&op=search&search='
    regUrl = baseUrl + '&op=getregdata&search='
    rolesUrl = baseUrl + '&op=getroles'

    getAllClubs = (callback) ->
      $http
        .get('/json/clubs.json')
        .success (result) ->
          callback(result)

    clubSearch = (search) ->
      $http
        .jsonp(searchUrl + search)
        .then (response) ->
          $filter('limitTo') response.data, 15

    getRegistration = (search) ->
      $http
        .jsonp(regUrl + search)
        .then (response) ->
          response.data

    getRoles = () ->
      $http
        .jsonp(rolesUrl)
        .then (response) ->
          response.data

    @getAllClubs     = getAllClubs
    @clubSearch      = clubSearch
    @getRegistration = getRegistration
    @getRoles        = getRoles

    undefined
  ]
