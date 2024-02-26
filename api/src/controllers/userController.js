const UserModel = require("../models/userModel"); 


const addUser = async (req, res) => {
  const { last_name, first_name, user_password, email } = req.body;

  const result = await UserModel.addUser({
    last_name,
    first_name,
    user_password,
    email,
  });

  if (result.error) {
    return res.status(400).send(result.error);
  }

  res.status(200).json({ user_id: result.user_id });
};


const getUser = async (req, res) => {
  try {
    const user_id = parseInt(req.params.id);
    const user = await db
      .select()
      .from(user)
      .where(eq(user.user_id, user_id))
      .execute();

    if (user.length > 0) {
      res.status(200).send(user[0]);
    } else {
      res.status(404).send({ message: "User not found" });
    }
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
};

module.exports = { addUser , getUser}; 
