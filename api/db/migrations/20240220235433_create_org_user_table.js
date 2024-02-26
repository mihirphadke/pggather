/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable("org_user", (table) => {
    table.increments("org_user_id").primary();
    table
      .integer("org_id")
      .references("org_id")
      .inTable("organization")
      .notNullable();
    table.string("email").notNullable().unique();
    table.string("org_password").notNullable();
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.schema.dropTable("org_user");
};
