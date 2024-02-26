/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable("org_post", (table) => {
    table.increments("org_post_id").primary();
    table
      .integer("org_id")
      .references("org_id")
      .inTable("organization")
      .notNullable();
    table
      .integer("org_user_id")
      .references("org_user_id")
      .inTable("org_user")
      .notNullable();
    table.string("category").notNullable();
    table.text("description").notNullable().unique();
    table.text("rule"); // Optional
    table.string("photo").notNullable();
    table.bigInteger("post_at").notNullable(); // Assuming this is a timestamp
    table.bigInteger("event_start_at"); // Optional timestamp
    table.bigInteger("event_end_at"); // Optional timestamp
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
    return knex.schema.dropTable("org_post");

};
