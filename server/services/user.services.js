const { prisma } = require("../db");

function findUserByEmail(email) {
    return prisma.user.findUnique({
      where: {
        email,
      },
    });
}
module.exports = {findUserByEmail}