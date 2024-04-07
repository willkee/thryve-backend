const username = process.env.DB_USERNAME;
const password = process.env.DB_PASSWORD;
const database = process.env.DB_DATABASE;
const host = process.env.DB_HOST;

export const development = {
	username,
	password,
	database,
	host,
	dialect: "postgres",
	seederStorage: "sequelize",
};

export const production = {
	use_env_variable: "DATABASE_URL",
	dialect: "postgres",
	seederStorage: "sequelize",
	dialectOptions: {
		ssl: {
			require: true,
			rejectUnauthorized: false,
		},
	},
};
