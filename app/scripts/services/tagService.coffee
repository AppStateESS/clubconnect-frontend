'use strict'

angular.module('ClubConnectApp')
  .service 'tagService', ['$http', ($http) ->

    monthTags = [
        name: 'January'
      ,
        name: 'February'
      ,
        name: 'March'
      ,
        name: 'April'
      ,
        name: 'May'
      ,
        name: 'June'
      ,
        name: 'July'
      ,
        name: 'August'
      ,
        name: 'September'
      ,
        name: 'October'
      ,
        name: 'November'
      ,
        name: 'December'
    ]

    @getSearchTags = (callback) ->
      $http
        .get('/json/searchtags.json')
        .success (result) ->
          callback result

    @getElectionTags = (callback) ->
      $http
        .get('/json/electiontags.json')
        .success (result) ->
          callback result

    @getMonthTags = (callback) ->
      callback monthTags[..]

    undefined
  ]
