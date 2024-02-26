const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

// Middlewares
app.use(express.json());

exports.tokenSecret = "$thisisatokensecret7589356677532199975elrm";
const cors = require("cors");
const corsOptions = {
  origin: "http://localhost:3000",
  optionsSuccessStatus: 200,
};
app.use(cors(corsOptions));

//Import routes
const userRouter = require("./src/routes/userRouter");
const loginRouter = require("./src/routes/loginRouter");

//Use routes
app.use("/pggather/users", userRouter);
app.use("/pggather/login", loginRouter);

// Global error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
