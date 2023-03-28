const db = require('../config/db');

module.exports = {

	// method to retrieve a page from the database
	'getPage': async function (key) { // key ==> care
		let conn = await db.getConnection();
		key = key.toLowerCase();

		// query to retrieve data for the page with `key` ==> "care"
		const result = await conn.query("select page_id,title,content,`key` from page where `key` = ?", [key]);



		let status = conn.end(); // release the connection back to the pool
		//console.log(result.length);

		let ret; // define ret at this scope level
		if (result.length < 1) { // check that there is at least 1 row
			// define result structure - no results
			return {
				'row': null,
				'status': false
			}
		} else {
			// define result structure: row has first (only) row of results in object notation
			return {
				'row': result[0],
				'status': true
			};
		}


	},
	'getMenuItems': async function () {
		let conn = await db.getConnection();
		const result = await conn.query("select page_id,title,`key` from page where menu_order is not null order by menu_order");
		conn.end();
		return result;
	},
	'updatePage': async function (key, title, content) {
		let conn = await db.getConnection();
		key = key.toLowerCase();
		const result = await conn.query(
			"update page set title = ?, content = ? where `key` = ?",
			[title, content, key]);
		conn.end();
		return result;
	}
};
