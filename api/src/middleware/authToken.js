const { tokenSecret } = require("../../app");
const jwt = require("jsonwebtoken");

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (token == null) return res.sendStatus(401);

  jwt.verify(token, tokenSecret, (err, user) => {
    if (err) {
      // Check if the error is due to token expiration
      if (err.name === "TokenExpiredError") {
        return res.status(401).send("Token expired");
      }
      return res.sendStatus(403);
    }

    req.user_id = user.user_id;
    next();
  });
};

module.exports =  authenticateToken ;
