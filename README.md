# Simple Ecto App

A simple Elixir application demonstrating basic CRUD operations using Ecto and PostgreSQL. This project serves as a learning example for working with Ecto schemas, migrations, and database operations in Elixir.

## Features

- User management with CRUD operations
- PostgreSQL database integration
- Data validation using Ecto changesets
- Sample data seeding functionality
- Basic user queries (by ID, email)

## Prerequisites

Before running this application, make sure you have the following installed:

- [Elixir](https://elixir-lang.org/install.html) (version 1.19 or later)
- [PostgreSQL](https://www.postgresql.org/download/) database server
- [Mix](https://hexdocs.pm/mix/Mix.html) (comes with Elixir)

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd simple_ecto_app
```

2. Install dependencies:
```bash
mix deps.get
```

3. Configure your database:
   - Update the database configuration in `config/config.exs` if needed
   - Default configuration uses:
     - Database: `simple_ecto_db`
     - Username: `postgres`
     - Password: `sliman`
     - Host: `localhost`

4. Create and migrate the database:
```bash
mix ecto.create
mix ecto.migrate
```

## Usage

### Starting the Application

Start an interactive Elixir session with the application loaded:

```bash
iex -S mix
```

### Basic Operations

#### Create a User
```elixir
# Create a user with default values
SimpleEctoApp.create_user()

# Create a user with custom attributes
SimpleEctoApp.create_user(%{name: "John Doe", email: "john@example.com", age: 30})
```

#### List All Users
```elixir
SimpleEctoApp.list_users()
```

#### Get User by ID
```elixir
SimpleEctoApp.get_user(1)
```

#### Find User by Email
```elixir
SimpleEctoApp.find_user_by_email("sliman@gmail.com")
```

#### Delete a User
```elixir
SimpleEctoApp.delete_user(1)
```

#### Seed Sample Data
```elixir
SimpleEctoApp.seed_data()
```

## Database Schema

### Users Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | integer | Primary key, auto-increment |
| name | string | Required |
| email | string | Required, must contain @ symbol |
| age | integer | Optional, must be greater than 0 |
| inserted_at | timestamp | Auto-generated |
| updated_at | timestamp | Auto-generated |

## Project Structure

```
simple_ecto_app/
├── lib/
│   ├── simple_ecto_app/
│   │   ├── application.ex      # Application supervisor
│   │   ├── repo.ex            # Ecto repository
│   │   └── user.ex            # User schema and changeset
│   └── simple_ecto_app.ex     # Main module with CRUD functions
├── priv/
│   └── repo/
│       └── migrations/        # Database migrations
├── config/
│   └── config.exs            # Application configuration
├── test/                     # Test files
├── mix.exs                   # Project configuration and dependencies
└── README.md                 # This file
```

## Dependencies

- **ecto_sql** (~> 3.10) - Database wrapper and query generator
- **postgrex** (>= 0.0.0) - PostgreSQL driver for Elixir

## Configuration

The application uses PostgreSQL as the database. Configuration is located in `config/config.exs`:

```elixir
config :simple_ecto_app, SimpleEctoApp.Repo,
  database: "simple_ecto_db",
  username: "postgres",
  password: "sliman",
  hostname: "localhost",
  pool_size: 10
```

## Development

### Running Tests
```bash
mix test
```

### Database Operations
```bash
# Create database
mix ecto.create

# Run migrations
mix ecto.migrate

# Rollback migration
mix ecto.rollback

# Reset database (drop, create, migrate)
mix ecto.reset

# Check migration status
mix ecto.migrations
```

### Creating New Migrations
```bash
mix ecto.gen.migration migration_name
```

## Example Session

```elixir
# Start IEx
iex -S mix

# Seed some data
iex> SimpleEctoApp.seed_data()

# List all users
iex> SimpleEctoApp.list_users()

# Find a specific user
iex> SimpleEctoApp.find_user_by_email("sliman@gmail.com")

# Create a new user
iex> SimpleEctoApp.create_user(%{name: "Jane Smith", email: "jane@test.com", age: 27})
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Learning Resources

- [Ecto Documentation](https://hexdocs.pm/ecto/Ecto.html)
- [Elixir Getting Started Guide](https://elixir-lang.org/getting-started/introduction.html)
- [Phoenix Framework](https://phoenixframework.org/) (for web applications)