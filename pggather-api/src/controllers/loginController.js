// controllers/AuthController.js

const UserModel = require("../models/userModel");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const { tokenSecret } = require("../../app"); // Make sure this path is correct

const login = async (req, res) => {
  const { email, user_password } = req.body;

  try {
    const user = await UserModel.findByEmail(email);
    if (!user) {
      return res.status(400).send("User doesn't exist.");
    }

    const hashed = crypto
      .createHash("sha256")
      .update(user_password + user.salt)
      .digest("hex");
    if (hashed === user.user_password) {
      const token = jwt.sign(
        { id: user.user_id, email: user.email },
        tokenSecret,
        { expiresIn: "1h" }
      );
      res.status(200).json({ token });
    } else {
      res.status(400).send("Invalid password.");
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("An error occurred during the login process.");
  }
};

const checkLogin = async (req, res) => {
  const { user_id } = req; 

  try {
    const user = await UserModel.findById(user_id);
    if (!user) {
      return res.status(404).send("No such user exists");
    }
    const output = {
      user_id: user.user_id,
      last_name: user.last_name,
      first_name: user.first_name,
      email: user.email,
    };

    res.status(200).json(output);
  } catch (error) {
    console.error(error);
    res.status(500).send("An error occurred while checking login status.");
  }
};



module.exports = { login , checkLogin };
