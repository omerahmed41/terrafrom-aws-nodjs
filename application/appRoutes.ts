import { Application } from 'express'; // Make sure to import Application if you are using Application type
import { AppController } from './appController';

export const configureAppRoutes = (app: Application): void => { // Use Application type here
  const appController = new AppController();
  app.get('/', appController.basicRoute);
  app.get('/html', appController.htmlRoute);
}
