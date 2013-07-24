'use strict'

angular.module('ClubConnectApp')
  .provider 'clubProvider', () ->
    clubs = [
        fullname: "Appalachian Linux Users Group"
        shortname: "ALUG"
        active: true
        electionTag: 'Technology'
        tags: ['Technology']
      ,
        fullname: "Anthropology Club"
        shortname: null
        active: true
        electionTag: 'Academics'
        tags: ['Academic']
      ,
        fullname: "I Phelta Thi"
        shortname: null
        active: true
        electionTag: 'Greek-lettered'
        tags: ['Fraternity', 'Service']
      ,
        fullname: "Epsilon Zeta Delta Zeta"
        shortname: "EZDZ"
        active: true
        electionTag: 'Greek-lettered'
        tags: ['Sorority', 'Service']
      ,
        fullname: "Phi Mu Alpha Symfonia"
        shortname: "PMAS"
        active: true
        electionTag: 'Honor'
        tags: ['Honor', 'Fraternity', 'Service']
    ]

    ClubProvider = () -> {
      getAllClubs: () ->
        clubs.slice(0)
    }

    this.$get = () ->
      new ClubProvider()

    undefined
