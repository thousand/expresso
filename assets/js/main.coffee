requirejs.config
  baseUrl: 'js/lib'
  paths:
    app: '../app'
  map:
    # this maps jQuery in noconflict mode.
    # http://requirejs.org/docs/jquery.html#cdnconfig
    '*':
      'jquery': 'jquery-private'
      'lodash': 'lodash.custom.min'

    'jquery-private':
      'jquery': 'jquery'

  # shim:
  #   'templates':
  #     exports: 'jade'

# Start the main app logic.
requirejs ['jquery', 'lodash'], ($,_) ->
  console.log('Hello world!')
