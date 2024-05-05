import Server from './infrastructure/server';
import dotenv from 'dotenv';
dotenv.config();

// Read the port from the environment, or use a default value
const port = process.env.PORT ? Number(process.env.PORT) : 3000;

Server.start(port);
