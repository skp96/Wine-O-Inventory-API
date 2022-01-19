# WineOInventoryApi [![CircleCI](https://circleci.com/gh/skp96/Wine-O-Inventory-API.svg?style=svg)](https://circleci.com/gh/skp96/Wine-O-Inventory-API)


Wine-O Inventory is a web application built using Phoenix and React. The application is a simple CRUD web app that allows users to keep track of their personal wine collection.

This repository contains the source code for Wine-O Inventory's backend. The code for the frontend can be found in the https://github.com/skp96/Wine-O-Inventory-Frontend repository.

## Installation


Before installing Phoenix, you will need to install a few dependencies in your Operating System. 

- [Install Elixir and the Erlang VM](https://elixir-lang.org/install.html)
  - Elixir Version: >= 1.12
  - Erlang Version: >= 24 
- [PostgreSQL](https://www.postgresql.org/download/)
  - Version: >= 14.1
- Hex Package Manager: `mix local.hex` 
  - The above command will install Hex; however, if you already have it installed, it will upgrade Hex to the latest version

## How to Set up Locally


1. Clone the repository

```
$ git clone https://github.com/skp96/Wine-O-Inventory-API.git
$ cd Wine-O-Inventory-API
```

1. Install dependencies

```
$ mix deps.get
```

1. Create and migrate your database

```
$ mix ecto.setup
```

4. Start the Phoenix server

```
$ mix phx.server # or inside IEx with iex -S mix phx.server
```

5. Confirm Phoenix server is up and running
   - In your browser visit http://localhost:4000/api/health-check. You should see the following JSON response `{"data":{"status":"pass"}}`

## How to Run Tests


```
$ mix test
```
