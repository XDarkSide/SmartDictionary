# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Language.create(language: "Українська", tag: "uk", created_at: Time.current, updated_at: Time.current)
Language.create(language: "Англійська", tag: "en", created_at: Time.current, updated_at: Time.current)
Language.create(language: "Німецька", tag: "de", created_at: Time.current, updated_at: Time.current)

CategoryItem.create(categoryName: "TestCategory1", created_at: Time.current, updated_at: Time.current)
CategoryItem.create(categoryName: "TestCategory2", created_at: Time.current, updated_at: Time.current)
CategoryItem.create(categoryName: "TestCategory3", created_at: Time.current, updated_at: Time.current)
