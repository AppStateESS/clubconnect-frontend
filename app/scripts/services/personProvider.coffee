'use strict'

angular.module('ClubConnectApp')
  .provider 'personProvider', () ->
    people = window.people

    retLimit = 100

    generalSearch = (token) ->
      itoken = parseInt(token)
      if not _.isNaN itoken then idSearch(itoken) else textSearch(token.toLowerCase())
    idSearch = (token) ->
      limit _.filter people, (person) ->
        person.id == token
    textSearch = (token) ->
      console.log(token)
      limit _.filter people, (person) ->
        !!(person.first.toLowerCase().indexOf(token) > -1) or
        !!(person.last.toLowerCase().indexOf(token) > -1) or
        !!(person.middle.toLowerCase().indexOf(token) > -1) or
        !!(person.username.toLowerCase().indexOf(token) > -1)
    limit = (arr) ->
      val for val, i in arr when i < retLimit

    # Private constructor
    class PersonProvider
      generalSearch: generalSearch
      idSearch: idSearch
      textSearch: textSearch
      limit: limit

    # Method for instantiating
    this.$get = () ->
      new PersonProvider()

    undefined
