# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MvpElixir.Repo.insert!(%MvpElixir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Create admin user
MvpElixir.Repo.insert!(%MvpElixir.Accounts.AdminUser{name: "admin", email: "admin@example.com", password_hash: MvpElixir.Accounts.encrypt_password("password")})
