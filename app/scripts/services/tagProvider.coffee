'use strict'

angular.module('ClubConnectApp')
  .provider 'tagProvider', () ->
    searchTags = [
        name: "Academics"
      ,
        name: "Athletics"
      ,
        name: "Business"
      ,
        name: "Dance"
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
        name: "Multicultural"
      ,
        name: "Politics"
      ,
        name: "Religion"
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

    TagProvider = () -> {
      getSearchTags: () ->
        searchTags.slice(0)
      getElectionTags: () ->
        electionTags.slice(0)
      getMonthTags: () ->
        monthTags.slice(0)
    }

    # Method for instantiating
    this.$get = () ->
      new TagProvider()

    undefined
