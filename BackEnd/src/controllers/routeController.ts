

class routeController {
  public test = {
    name: 'thành'
  }
  constructor() {

  }

  get() {
    return (req, res) => { 
      res.json({name: 'thành'})
    }
  }
}
export const routeCon = new routeController();

