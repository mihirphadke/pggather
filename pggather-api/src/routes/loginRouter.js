const loginController = require("../controllers/loginController");
const validationErrorHandler = require("../middleware/ValidationErrorHandler");
const authToken = require("../middleware/authToken");
const { body } = require("express-validator");
const express = require("express");
const router = express.Router();
router.post(
  "/",
  [
    body("email").isString().isLength({ max: 16 }),
    body("user_password").isString().isLength({ max: 16 }),
  ],
  validationErrorHandler,
  loginController.login
);
router.get("/", authToken, loginController.checkLogin);

module.exports = router;
