'use strict';

angular.module('clubconnectApp')
  .service('clubProvider', function clubProvider() {
    var clubProvider = {
      getAllClubs: function() {
        return [
          {
            fullname: "Appalachian Linux Users Group",
            shortname: "ALUG",
            active: true,
            electionTag: 'Technology',
            tags: ['Religious', 'Special Interest']
          },
          {
            fullname: "Anthropology Club",
            shortname: null,
            active: true,
            electionTag: 'Academics',
            tags: ['Special Interest']
          },
          {
            fullname: "I Phelta Thi",
            shortname: null,
            active: true,
            electionTag: 'Greek-lettered',
            tags: ['Fraternity', 'Service']
          },
          {
            fullname: "Epsilon Zeta Delta Zeta",
            shortname: "EZDZ",
            active: true,
            electionTag: 'Greek-lettered',
            tags: ['Fraternity', 'Service']
          },
          {
            fullname: "Phi Mu Alpha Symfonia",
            shortname: "PMAS",
            active: true,
            electionTag: 'Honor',
            tags: ['Greek-lettered', 'Service']
          }
        ];
      }
    };

    return clubProvider;
  });
