'use strict'

angular.module('ClubConnectApp')
	.controller 'AdminOverviewCtrl', ['$scope', (scope) ->
		$scope.columns = [
			key: 'fullname'
			name: 'Full Name'
			icon: null
			type: 'string'
		,
			key: 'shortname'
			name: 'Short Name'
			icon: null
			type: 'string'
		,
			key: 'registered'
			name: 'Registered'
			icon: null
			type: 'boolean'
		,
			key: 'address'
			name: 'Address'
			icon: null
			type: 'string'
		]

		$scope.clubs = [
			fullname:   'Appalachian Linux Users Group'
			shortname:  'alug'
			registered: true
			address:    '123 Fuck Off St.'
		,
			fullname:   'I Phelta Thi'
			shortname:  'IPT'
			registered: true
			address:    '321 Greek Ln.'
		,
			fullname:   'Tappa Kegga'
			shortname:  'TK'
			registered: true
			address:    '322 Greek Ln.'
		,
			fullname:   'Jesus Club'
			shortname:  'yhwh'
			registered: true
			address:    '100 Transubstantiation Blvd.'
		]
	]