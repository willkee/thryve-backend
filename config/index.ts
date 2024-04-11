import dotenv from "dotenv";
dotenv.config();

const config = {
	environment: process.env.NODE_ENV || "development",
	port: process.env.PORT || 8000,
};

export default config;
