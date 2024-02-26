/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable("user_profile", (table) => {
    table.increments("user_profile_id").primary();
    table
      .integer("user_id")
      .references("user_id")
      .inTable("user")
      .notNullable();
    table
      .integer("skill_id")
      .references("skill_id")
      .inTable("skill")
      .notNullable();
    table.integer("post_id").references("post_id").inTable("org_post");
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.schema.dropTable("user_profile");
};
