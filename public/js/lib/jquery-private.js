// this config is required to map jQuery to work properly in noconflict mode accross modules.
// http://requirejs.org/docs/jquery.html#cdnconfig

define(['jquery'], function (jq) {
    return jq.noConflict();
});
