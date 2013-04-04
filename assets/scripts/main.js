require.config({
  baseUrl: '/scripts/',
  deps: ['cs!app/app'],
  paths: {
    'coffee-script': 'lib/coffee-script/coffee-script',
    cs: 'lib/require/cs',
    text: 'lib/require/text',
    jquery: 'lib/jquery/jquery-1.9.1',
    handlebars: 'lib/handlebars/handlebars',
    ember: 'lib/ember/ember',
    DS: 'lib/ember/ember-data'
    },
  shim: {
    'jquery':{
      deps: [],
      exports: '$'
    },
    'handlebars': {
      deps: ['jquery'],
      exports: 'Handlebars'
    },
    'ember': {
      deps: ['jquery', 'handlebars'],
      exports: 'Ember'
    },
    'DS': {
      deps: ['ember'],
      exports: 'DS'
    },
  }
});