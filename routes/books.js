const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/:bookId([1-9][0-9]*)', function (req, res, next) {

	// get bookid: record
	res.render('book', { bookId: req.params.bookId });
});


module.exports = router;
