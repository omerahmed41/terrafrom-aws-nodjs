import { Request, Response } from 'express';
import { DomainFunctions } from '../domain/domainFunctions';

export class AppController {
  private domainFunctions: DomainFunctions;

  constructor() {
    this.domainFunctions = new DomainFunctions();
  }

  public basicRoute = (req: Request, res: Response): void => {
    const message = this.domainFunctions.getHelloMessage();
    res.send(message);
  }
  public htmlRoute = (req: Request, res: Response): void => {
    const message = this.domainFunctions.getHelloMessageHTML();
    res.send(message);
  }
}
