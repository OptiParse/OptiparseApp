const express = require("express");
const morgan = require("morgan"); 
const cors = require("cors");
require("dotenv").config();

const app = express();


app.use(express.json());
app.use(morgan('dev'));
app.use(cors({
    credentials: true,
    origin: true
  }));

const port = process.env.PORT || 3000;

const authRoutes = require("./routes/authRoutes.js");
const userRoutes = require("./routes/userRoutes.js");
const transactionRoutes = require("./routes/transactionRoutes.js");
const authenticate = require("./middleware/authenticate.js");

app.get("/", (req, res) => {
  res.send("Welcome Tou Prisma, Express And PSQL Tutorial");
});
app.get("/protected", authenticate, (req, res) => {
  res.status(200).send(`Welcome to the protected route, ${req.user.email}`);
});

app.use("/api/auth", authRoutes);
app.use("/api/user", userRoutes);
app.use("/api/transaction",authenticate, transactionRoutes);

app.listen(port, () => {
  console.log(`Server listening on ${port}`);
});

