defmodule MvpElixir.Repo.Migrations.CreateAdminUsers do
  use Ecto.Migration

  def change do
    create table(:admin_users) do
      add :name, :string
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :reset_password_token, :string

      timestamps()
    end
  end
end
