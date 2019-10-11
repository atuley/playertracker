defmodule Playertracker.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Playertracker.Factory
      use Hound.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Playertracker.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Playertracker.Repo, {:shared, self()})
    end

    {:ok, %{}}
  end
end
