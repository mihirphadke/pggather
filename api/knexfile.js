// knexfile.js
module.exports = {
  development: {
    client: "sqlite3",
    connection: {
      filename: "./dev.sqlite", // Path to your SQLite database file
    },
    useNullAsDefault: true,

    migrations: {
      directory: "./db/migrations", // Your migrations directory
    },
    seeds: {
      directory: "./db/seeds", // Your seeds directory
    },
    pool: {
      min: 0,
      max: 10,
      afterCreate: (conn, done) => {
        // Runs after a connection is made to the sqlite engine.
        conn.exec("PRAGMA foreign_keys = ON", done); // Enable foreign key constraint
      },
    },
  },
};
