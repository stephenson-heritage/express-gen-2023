var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
	res.render('index', {
		title: 'My Cite',
		name: req.login.auth ? req.login.username : "guest"
	});
});

router.all('/', function (req, res, next) {
	res.render('index', { title: 'My Cite' });
});

router.get('/cats?ndogs?', function (req, res, next) {
	res.render('index', { title: "cats", name: "Joshua" });
});

// router.get('/ca+ts', function (req, res, next) {
// 	res.render('index', { title: "caaaaaaaaaaaaaaaaaaaaaaaaaa....", name: "Kendra" });
// });

router.get('/c(at)+s', function (req, res, next) {
	res.render('index', { title: "catatatata....", name: req.username });
});


router.get('/fro*do', function (req, res, next) {
	res.render('index', { title: "frodo is hungry, feed him", name: "Joshua" });
});

router.get('/:type(cat|dog)', function (req, res, next) {
	res.render('index', { title: req.params.type, name: "Omar" });
});
// router.get('/:msg', function (req, res, next) {
// 	res.render('index', { title: req.params.msg });
// });


module.exports = router;
