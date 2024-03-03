/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable("user", (table) => {
    table.increments("user_id").primary();
    table.string("last_name").notNullable();
    table.string("first_name").notNullable();
    table.bigInteger("birth_at").notNullable();
    table.string("user_password").notNullable();
    table.string("salt").notNullable();
    table.string("email").notNullable().unique();
    table.bigInteger("last_updated_at"); 
  });
};

exports.down = function (knex) {
  return knex.schema.dropTable("user");
};
