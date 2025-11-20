defmodule SimpleEctoApp do
  alias SimpleEctoApp.{Repo, User}

  # Function to add a user
  def create_user(attrs \\ %{name: "Sliman", email: "sliman@gmail.com", age: 25}) do
    changeset = User.changeset(%User{}, attrs)

    case Repo.insert(changeset) do
      {:ok, user} ->
        IO.puts("Success: #{user.name}")
        user
      {:error, changeset} ->
        IO.puts("Failed: #{inspect(changeset.errors)}")
        changeset
    end
  end

  # Function to get all users
  def list_users do
    users = Repo.all(User)
    IO.puts("Number of users: #{length(users)}")
    IO.inspect(users)
    users
  end

  # Function to get user by ID
  def get_user(id) do
    case Repo.get(User, id) do
      nil ->
        IO.puts("No user found with ID #{id}")
        nil
      user ->
        IO.puts("User: #{user.name}")
        user
    end
  end

  # Function to search by email
  def find_user_by_email(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        IO.puts("No user found with email #{email}")
        nil
      user ->
        IO.puts("Found: #{user.name}")
        user
    end
  end

  # Function to delete a user
  def delete_user(id) do
    case Repo.get(User, id) do
      nil ->
        IO.puts("No user found with ID #{id}")
        nil
      user ->
        case Repo.delete(user) do
          {:ok, _} -> IO.puts("Deleted user: #{user.name}")
          {:error, _} -> IO.puts("Failed to delete")
        end
    end
  end

  # Function to seed sample data
  def seed_data do
    IO.puts("Adding sample data...")

    users = [
      %{name: "Sliman", email: "sliman@gmail.com", age: 25},
      %{name: "Ahmed", email: "ahmed@test.com", age: 30},
      %{name: "Mohamed", email: "mohamed@example.com", age: 28}
    ]

    Enum.each(users, fn user_attrs ->
      create_user(user_attrs)
    end)

    IO.puts("Sample data added successfully")
  end
end
