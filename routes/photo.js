const router = require('express').Router();
const photo = require('../model/photo');

router.get('/', async (req, res) => {

	const photos = await photo();

	console.log(photos.rows);
	res.render('photos', photos.rows);

});


module.exports = router;