const knex = require("knex")(require("../../knexfile").development);
const crypto = require("crypto");

class User {
  static findAll() {
    return knex("user").select("*");
  }

  static findByEmail(email) {
    return knex("user").where("email", email).first();
  }

  static findById(id) {
    return knex("user").where("id", id).first();
  }
  static async addUser({ last_name, first_name, user_password, email }) {
    try {
      // Check if the email is already used
      const existingUsers = await knex("user").where({ email });
      if (existingUsers.length > 0) {
        return { error: "This email is already used." };
      }

      // Hash the password with a salt
      const salt = (Date.now() % 1000000).toString();
      const hashedPassword = this.hashPassword(user_password, salt);

      // Insert the new user and return the user ID
      const [user_id] = await knex("user").insert(
        {
          last_name,
          first_name,
          user_password: hashedPassword,
          salt,
          email,
        },
        "user_id"
      );

      return { user_id };
    } catch (error) {
      console.error(error);
      return { error: "Insert failed due to an internal error." };
    }
  }

  static hashPassword(password, salt) {
    return crypto
      .createHash("sha256")
      .update(password + salt)
      .digest("hex");
  }

}

// Add more functions as needed

module.exports = User;
