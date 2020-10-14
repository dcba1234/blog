

class routeController {
  public test = {
    name: 'thành'
  }
  constructor() {

  }

  get() {
    console.log(this.test)
    return (req, res) => { 
      console.log(this)
      res.json({name: 'thành'})
    }
  }
}
export const routeCon = new routeController();

