const defaultPage = 'index';

const router = require('express').Router();
const page = require('../model/page');

/* GET home page. */
router.get('/', function (req, res, next) {
	loadPage('index', defaultPage, req, res, next);
});
router.get('/addpage', async function (req, res, next) {

	const menuItems = await page.getMenuItems(); // retrieve the menu items
	//console.log(menuItems);
	// there is a matching page (with key ==> "care")
	res.render('addPage', { // render template 'index.hbs', send the page title, page content
		menu: menuItems,
		login: req.login,
		redirect: req.baseUrl + req.path
	});

});

router.get('/:key/edit', async function (req, res, next) {
	loadPage('editPage', req.params.key, req, res, next);
});

router.get('/:key/delete', async function (req, res, next) {
	if (req.login.loggedIn) {
		page.getPage(req.params.key).then((pg) => {
			if (pg.key == defaultPage) {
				res.send('Cannot delete default page');
			} else {
				if (pg.status) {
					page.deletePage(pg.row.key);
					res.redirect('/');
				} else {
					res.send('Page not found');
				}
			}
		});
	} else {

		next();
	}
});

router.post('/addpage', async function (req, res, next) {

	if (req.login.loggedIn) {
		let title = req.body.title;
		let content = req.body.content;
		let key = req.body.key.toLowerCase().replace(/s/g, '');
		page.addPage(key, req.login.user.user_id, title, content);
	}

	res.redirect('/');
});
router.post('/:key/edit', async function (req, res, next) {

	if (req.login.loggedIn) {
		let title = req.body.title;
		let content = req.body.content;
		let key = req.body.key;
		page.updatePage(key, req.login.user.user_id, title, content);
	}

	res.redirect('/' + req.params.key);
});

router.get('/:key', async function (req, res, next) {
	loadPage('index', req.params.key, req, res, next);
});


let loadPage = async function (template, key, req, res, next) {
	// eg url: localhost:9000/care
	// key ==> care
	const pg = await page.getPage(key); // try to retrieve the row from the model for the key "care"	
	// pg. => (row, status)
	if (pg.status == false) {
		next(); // no matching page, call next (go to next endpoint handler)
	} else {
		const menuItems = await page.getMenuItems(); // retrieve the menu items
		//console.log(menuItems);
		// there is a matching page (with key ==> "care")
		res.render(template, { // render template 'index.hbs', send the page title, page content
			menu: menuItems,
			title: pg.row.title,
			key: pg.row.key,
			login: req.login,
			content: pg.row.content,
			redirect: req.baseUrl + req.path
			// home/1 
		});
	}
}

module.exports = router;
