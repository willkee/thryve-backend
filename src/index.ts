import express, { Request, Response } from "express";
import config from "../config";

import db from "../db/models/index.js";

const app = express();

app.get("/", (req: Request, res: Response) => {
	res.send("Hello World");
});

try {
	db.sequelize.authenticate().then(() => {
		console.log(
			"Connection to the database has been established successfully."
		);
		app.listen(config.port, () => {
			console.log(`Server is running on port ${config.port}...`);
		});
	});
} catch (err) {
	console.error("Unable to connect to the database:", err);
}
