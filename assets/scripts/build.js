({
  baseUrl: '.',
  out: '../../public/js/main.js',
  optimize: "uglify2",
  name: 'lib/require/almond',
  mainConfigFile:'main.js',
  wrap: false,
  stubModules: ['cs', 'text'],
  excludeShallow: ['coffee-script']
})