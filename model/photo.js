const db = require('../config/db');

let getPhotos = async function () {

	let conn = await db.getConnection();
	const result = await conn.query("select photo_id, filename, description,date_modified from photo order by date_modified");

	let status = conn.end();

	let ret = {
		'rows': result,
		'status': status
	};

	return ret;
}


module.exports = getPhotos;