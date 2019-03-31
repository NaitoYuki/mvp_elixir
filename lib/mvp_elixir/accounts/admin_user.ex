defmodule MvpElixir.Accounts.AdminUser do
  use MvpElixir.Schema

  import MvpElixirWeb.Gettext

  schema "admin_users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :reset_password_token, :string
    field :current_password, :string, virtual: true
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(admin_user, attrs \\ %{}) do
    admin_user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end

  def create_changeset(admin_user, attrs \\ %{}) do
    admin_user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_change(:password_hash, MvpElixir.Accounts.encrypt_password(attrs["password"]))
  end

  def password_changeset(admin_user, attrs \\ %{}) do
    admin_user
    |> cast(attrs, [:current_password, :password])
    |> validate_required([:current_password, :password])
    |> validate_change(:current_password, fn _, current_password ->
        case MvpElixir.Accounts.authenticate_admin_user(admin_user.email, current_password) do
          {:ok, _} ->
            []
          {:error, _} ->
            [current_password: gettext("is invalid")]
        end
      end)
    |> validate_confirmation(:password)
    |> put_change(:password_hash, MvpElixir.Accounts.encrypt_password(attrs["password"]))
  end

  def password_reset_changeset(admin_user, attrs \\ %{}) do
    admin_user
    |> cast(attrs, [:password])
    |> validate_required([:password])
    |> validate_confirmation(:password)
    |> put_change(:password_hash, MvpElixir.Accounts.encrypt_password(attrs["password"]))
    |> put_change(:reset_password_token, nil)
  end
end
