'use strict'

angular.module('ClubConnectApp')
  .service 'tagService', ['$http', '$q', ($http, $q) ->

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

    searchTags = 
      [{"name":"Academics"},
      {"name":"Athletics"},
      {"name":"Business"},
      {"name":"Culture"},
      {"name":"Dance"},
      {"name":"Education"},
      {"name":"Global Learning"},
      {"name":"Visual Art"},
      {"name":"Fraternity"},
      {"name":"Health"},
      {"name":"Honor"},
      {"name":"Humanities"},
      {"name":"Language"},
      {"name":"Leadership"},
      {"name":"Music"},
      {"name":"Multicultural"},
      {"name":"Politics"},
      {"name":"Religion"},
      {"name":"Residence Life"},
      {"name":"Science"},
      {"name":"Service"},
      {"name":"Sexuality"},
      {"name":"Social"},
      {"name":"Sorority"},
      {"name":"Sustainability"},
      {"name":"Technology"},
      {"name":"Theatre"}]

    electionTags = [{"name":"Greek Life (Fraternities and Sororities Only)","val":1},{"name":"Honors / Academics","val":2},{"name":"Multicultural Affairs","val":3},{"name":"Sports","val":4},{"name":"Service Initiative","val":5},{"name":"Special Interest","val":6}]

    @getSearchTags = getSearchTags = () ->
      d = $q.defer()
      d.resolve searchTags[..]
      d.promise

    @getElectionTags = getElectionTags = () ->
      d = $q.defer()
      d.resolve electionTags[..]
      d.promise

    @getMonthTags = getElectionTags = () ->
      d = $q.defer()
      d.resolve monthTags[..]
      d.promise

    undefined
  ]
