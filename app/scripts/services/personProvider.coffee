'use strict'

angular.module('ClubConnectApp')
  .service 'personService', ['$http', ($http) ->
    people = window.people

    retLimit = 1000

    # Entry point for search, will make decisions on how to search based on input
    generalSearch = (searchstr) ->
      searchint = parseInt searchstr
      console.log(searchstr)
      if not _.isNaN searchint
        idSearch people searchint
      else
        textSearch searchstr

    # Simple ID matching search
    idSearch = (set, searchint) ->
      # Filter by integer equivalence and limit results
      limit _.filter set, (person) ->
        person.id == searchint

    # Substring search
    textSearch = (searchstr) ->

      # Remove anything not a letter or a space, normalize to lowercase, break input into tokens
      tokens = searchstr.replace(/[^a-zA-Z ]/, '').toLowerCase().split(' ')

      # Filter by search string and limit results
      limit _.filter people, (person) ->
        # Make one string for convenience, normalize to lowercase
        concat = [person.first, person.middle, person.last, person.username].join('|').toLowerCase()

        # All tokens must match Any field for this record to be a match
        _.every tokens, (token) ->
          concat.indexOf(token) > -1

    # Let's not return a billion results to the DOM, that might be bad
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
  ]
