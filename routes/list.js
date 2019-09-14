var express = require('express');

module.exports = function(frontend, api) {
  var router = express.Router();
  router.get('/', frontend.list);
  return router;
};
