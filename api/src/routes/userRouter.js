const express = require("express");
const { body } = require("express-validator");
const validationErrorHandler = require ("../middleware/ValidationErrorHandler");

const userController = require("../controllers/userController");
const router = express.Router();

router.get("/", userController.getUser);
router.post(
  "/",
  [
    body("last_name").isString().isLength({ max: 16 }),
    body("first_name").isString().isLength({ max: 16 }),
    body("user_password").isString().isLength({ min: 6, max: 12 }),
    body("birth_at").isInt(),
    body("email").isEmail(),
  ],
  validationErrorHandler,
  userController.addUser
);

module.exports = router;
