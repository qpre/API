import JSON
import Octopus

func attachUsersRoutes(router: Octopus.Router) {
  router.get("/users") { (req, res) -> Octopus.HTTPResponse in
    res.contentType = "application/json; charset=utf-8"
    res.payload     = String(["0": ["name": "quentin", "lastname": "pré"]] as JSON)

    return res
  }
}
