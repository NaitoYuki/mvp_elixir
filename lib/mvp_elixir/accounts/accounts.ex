defmodule MvpElixir.Accounts do
  import Ecto.{Query, Changeset}, warn: false
  alias MvpElixir.{Repo}
  alias MvpElixir.Accounts.{AdminUser}

  def encrypt_password(password), do: Comeonin.Bcrypt.hashpwsalt(password || "")

  def authenticate_admin_user(email, password) do
    Repo.get_by(AdminUser, email: email)
    |> Comeonin.Bcrypt.check_pass(password)
  end
end
