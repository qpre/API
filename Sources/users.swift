import JSON
import Octopus

func attachUsersRoutes(router: Octopus.Router) {
  /*
  ** GET users
  ** sends the whole list of users
  **
  ** TODO: please paginate...
  */
  router.get("/users") { (req, res) -> Octopus.HTTPResponse in
    res.contentType = "application/json; charset=utf-8"
    res.payload     = String(["0": ["name": "quentin", "lastname": "pré"]] as JSON)

    return res
  }

  /*
  ** GET user
  ** sends the informations for one specific user
  */
  router.get("/users/:id") { (req, res) -> Octopus.HTTPResponse in
    res.contentType = "application/json; charset=utf-8"
    res.payload     = String(["name": "quentin", "lastname": "pré"] as JSON)

    return res
  }
}
