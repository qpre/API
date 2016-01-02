import JSON
import Octopus

func attachUsersRoutes(router: Octopus.Router) {
  router.get("/users") { (req, res) -> Octopus.HTTPResponse in
    let json: JSON = ["0": ["name": "quentin", "lastname": "pré"]]

    res.contentType = "application/json; charset=utf-8"
    res.payload     = String(json)

    return res
  }
}
