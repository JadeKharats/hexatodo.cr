# HexaTodo

This project demonstrates a simple ToDo application built in Crystal programming language following the principles of Hexagonal Architecture (Ports and Adapters). Hexagonal Architecture promotes modularity and testability by structuring the application around core domain logic with input and output ports.

## Features

* Create, read, update, and delete (CRUD) operations for ToDo items.
* Mark ToDo items as completed.
* Console-based user interface for interaction.

## Architecture Overview

The application is structured according to Hexagonal Architecture principles, with three main components:

* Core Domain: Contains the core business logic and entities.
* Input Ports: Define the contract for external interactions with the application.
* Output Ports: Define the contract for the application's interactions with external systems.

## Installation

1. Install Crystal programming language if you haven't already. Follow the instructions [here](https://crystal-lang.org/install/).
2. clone this repository :
```bash
git clone https://github.com/JadeKharats/hexatodo.cr
```
3. Navigate to the project directory:
```bash
cd hexatodo.cr
```
4. Compile
```
shards build
```

Now, you have binaries in `./bin` folder

## Usage

### Webserver

TODO: write webserver usage

### CLI

TODO: Add CLI usage

## Structure

* domain/todo.cr: Contains the core domain entities representing the business logic.
* domain/inputport.cr: Defines the contract for external interactions with the application.
* domain/outputport.cr: Defines the contract for the application's interactions with external systems.
* application/repositories/inmemory.cr: Implements the repository interface for storing ToDo items in memory.
* ports/console_output.cr: Implements the output port to interact with the console.
* domain/todoservices.cr: Implements the business logic and use cases.

## Dependencies

This project has no external dependencies beyond the Crystal standard library.

## Roadmap

- [x] Initialize Hexagonal Architecture.
- [ ] Generate documentation with `crystal docs` command
- [ ] Add CLI usage (with option-parser)
- [ ] Add HTTP usage
  1. [ ] Add server (with http/server)
  2. [ ] Add page (with ECR)
  3. [ ] Bonus : Add HTMX integration
- [ ] Add repository in file (with File, JSON, YAML)
  1. [ ] Add JSON repository
  2. [ ] Add YAML repository

To go further, with external libraries

- [ ] Add Port with `action-controller`
- [ ] Add repository implementations:
  1. [ ] SQLite (with `crystal-db`)
  2. [ ] RethinkDB
- [ ] Design CLI to use API Port
  - [ ] make OPENAPI API with `action-controller`
  - [ ] make CLI client
- [ ] Add ToDo fields:
  1. [ ] Add Status ENUM to ToDo
  2. [ ] Add full description to ToDo
- [ ] Add user management
  1. [ ] Signup/signin/logout
  2. [ ] Add author to ToDo
  3. [ ] Add assign to ToDo
- [ ] Add due date 
- [ ] Add labels or tags
- [ ] Add milestone to group ToDo
- [ ] Add dependencies between ToDo
- [ ] Add Product to group ToDo and user
- [ ] Add subtask to ToDo

Bonus

- [ ] Add Trophy :
  1. [ ] the most closed ToDo
  2. [ ] the most open ToDo
  3. [ ] the same by milestone



## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/JadeKharats/hexatodo.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jade D. Kharats](https://github.com/JadeKharats) - creator and maintainer
