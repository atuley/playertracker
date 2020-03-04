defmodule Playertracker.Factory do
  use ExMachina.Ecto, repo: Playertracker.Repo

  defp set_password(user) do
    hashed_password = Comeonin.Bcrypt.hashpwsalt(user.password)

    user
    |> Map.merge(%{password_hash: hashed_password, password: nil})
  end

  def user_factory() do
    %Playertracker.Accounts.User{
      email: sequence(:email, &"user-#{&1}@example.com"),
      password: "password"
    }
    |> set_password
  end

  def player_factory() do
    %Playertracker.Player{
      first_name: "Kobe",
      last_name: "Bryant",
      player_id: "12345",
      number: "24",
      position: "G",
      team_color: "#fff",
      tricode: "LAL"
    }
  end
end
