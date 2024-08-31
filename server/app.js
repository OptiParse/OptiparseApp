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
app.use("/api/auth", authRoutes);
app.get("/", (req, res) => {
  res.send("Welcome Tou Prisma, Express And PSQL Tutorial");
});

app.listen(port, () => {
  console.log(`Server listening on ${port}`);
});

