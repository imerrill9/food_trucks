# San Francisco Food Trucks

## Project Overview

San Francisco Food Trucks is a web application that leverages the Phoenix LiveView framework to provide real-time interaction without full page reloads. Users can instantly filter food trucks available in San Francisco based on food items. This application consumes data directly from the San Francisco government's public API for Mobile Food Facility Permits.

## Features

- **Live Filtering:** Users can filter food trucks by food items in real-time.
- **No Database Required:** Runs without a local database, simplifying setup and minimizing local system requirements.

## Getting Started

### Prerequisites

Before you start, ensure you have the following installed:

- Elixir 1.12 or later (compatible with Phoenix 1.7 and other dependencies)
- Erlang/OTP 24 or later (recommended for compatibility with the latest Elixir and Phoenix versions)
- Phoenix Framework 1.7.12 or later
- Node.js 14 or later (for asset management with esbuild and potentially other front-end tools like Tailwind)

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
