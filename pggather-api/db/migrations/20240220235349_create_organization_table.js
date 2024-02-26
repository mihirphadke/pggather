/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable("organization", (table) => {
    table.increments("org_id").primary();
    table.integer("org_num").notNullable();
    table.string("org_name").notNullable();
    table.string("website_link").notNullable();
    table.string("map_link").notNullable();
    table.bigInteger("start_at").notNullable(); // Assuming this is a timestamp
    table.boolean("temp_stop").notNullable(); // Assuming this is a boolean flag
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.schema.dropTable("organization");
};
