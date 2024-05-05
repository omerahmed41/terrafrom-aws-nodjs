import express, { Application } from 'express';
import { configureAppRoutes } from '../application/appRoutes';

class Server {
  private static instance: Application;

  private constructor() {}

  public static getInstance(): Application {
    if (!Server.instance) {
      Server.instance = express();
      Server.instance.use(express.json());
      configureAppRoutes(Server.instance);
    }
    return Server.instance;
  }

  public static start(port: number) {
    Server.getInstance().listen(port, () => {
      console.log(`Server is listening at http://localhost:${port}`);
    });
  }
}

export default Server;
