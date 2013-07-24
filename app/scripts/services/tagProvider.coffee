'use strict'

angular.module('ClubConnectApp')
  .provider 'tagProvider', () ->
    searchTags = [
        name: "Academic"
      ,
        name: "Athletic"
      ,
        name: "Business"
      ,
        name: "Education"
      ,
        name: "Visual Art"
      ,
        name: "Fraternity"
      ,
        name: "Health"
      ,
        name: "Honor"
      ,
        name: "Leadership"
      ,
        name: "Music"
      ,
        name: "Political"
      ,
        name: "Religious"
      ,
        name: "Residence Life"
      ,
        name: "Service"
      ,
        name: "Sexuality"
      ,
        name: "Sorority"
      ,
        name: "Technology"
      ,
        name: "Theatre"
    ]

    electionTags = [
        name: 'Greek Life'
      ,
        name: 'Honors / Academics'
      ,
        name: 'Multicultural Affairs'
      ,
        name: 'Sports'
      ,
        name: 'Service Initiative'
      ,
        name: 'Special Interest'
    ]

    TagProvider = () -> {
      getSearchTags: () ->
        searchTags.slice(0)
      getElectionTags: () ->
        electionTags.slice(0)
    }

    # Method for instantiating
    this.$get = () ->
      new TagProvider()

    undefined
