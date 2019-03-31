defmodule MvpElixir.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      use Timex.Ecto.Timestamps

      import Ecto.Changeset
      import Ecto.Query

      alias MvpElixir.Repo

      defp put_audit(changeset, admin_user) do
        if changeset.changes == %{} do
          changeset
        else
          case Ecto.get_meta(changeset.data, :state) do
            :built ->
              changeset
              |> put_change(:insert_admin_user_id, admin_user.id)
              |> put_change(:update_admin_user_id, admin_user.id)
            :loaded ->
              changeset
              |> put_change(:update_admin_user_id, admin_user.id)
          end
        end
      end

      defp mark_for_deletion(changeset, %{"delete" => _}), do: %{changeset | action: :delete}
      defp mark_for_deletion(changeset, _), do: changeset
    end
  end
end
