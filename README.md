# Elixir Tutorial

A comprehensive tutorial project demonstrating Elixir programming concepts, from basics to advanced topics like OTP (Open Telecom Platform).

## 🚀 Getting Started

### Prerequisites

First, you'll need to install Elixir. See [INSTALL.md](INSTALL.md) for detailed installation instructions.

### Running the Project

```bash
# Clone or navigate to this project directory
cd elixir_howto

# Install dependencies
mix deps.get

# Compile the project
mix compile

# Run tests
mix test

# Start an interactive Elixir session with the project loaded
iex -S mix

# Format code
mix format

# Generate documentation
mix docs
```

## 📚 Learning Path

This tutorial is structured to take you from Elixir basics to advanced concepts. Follow this recommended learning path:

### 1. Basic Concepts

Start with these fundamental Elixir concepts:

#### Data Types (`lib/elixir_tutorial/data_types.ex`)
Learn about Elixir's built-in data types:
- Integers, floats, booleans
- Atoms (constants)
- Strings and binaries
- Lists and tuples
- Maps and keyword lists

```elixir
# Try in iex -S mix:
ElixirTutorial.DataTypes.integer_examples()
ElixirTutorial.DataTypes.string_operations("Hello Elixir")
```

#### Pattern Matching (`lib/elixir_tutorial/pattern_matching.ex`)
Master Elixir's most powerful feature:
- Basic pattern matching
- Destructuring data structures
- Guards and when clauses
- The pin operator (^)

```elixir
# Try in iex -S mix:
ElixirTutorial.PatternMatching.handle_result({:ok, "success"})
ElixirTutorial.PatternMatching.list_pattern([1, 2, 3])
```

#### Functions (`lib/elixir_tutorial/functions.ex`)
Understand different types of functions:
- Named functions with multiple clauses
- Anonymous functions
- Higher-order functions
- Function capturing
- The pipe operator
- Recursion and tail recursion

```elixir
# Try in iex -S mix:
ElixirTutorial.Functions.factorial(5)
ElixirTutorial.Functions.pipe_examples("hello world")
```

### 2. Core Module (`lib/elixir_tutorial.ex`)
The main module demonstrates:
- Module documentation
- Function documentation with examples
- Basic calculations
- Pattern matching in practice

```elixir
# Try in iex -S mix:
ElixirTutorial.hello("World")
ElixirTutorial.calculate(:add, 10, 5)
ElixirTutorial.describe_data([1, 2, 3])
```

### 3. Advanced Concepts

Once comfortable with basics, explore these advanced topics:

#### Processes (`lib/elixir_tutorial/processes.ex`)
Learn about Elixir's lightweight processes:
- Creating processes with `spawn`
- Message passing with `send` and `receive`
- Process monitoring and linking
- Building simple server processes

```elixir
# Try in iex -S mix:
ElixirTutorial.Processes.simple_message_passing()
ElixirTutorial.Processes.spawn_many_processes(1000)
```

#### GenServer (`lib/elixir_tutorial/counter.ex`)
Understand OTP GenServers:
- State management
- Synchronous calls (`handle_call`)
- Asynchronous casts (`handle_cast`)
- Process supervision

```elixir
# Try in iex -S mix:
{:ok, counter} = ElixirTutorial.Counter.start_link([])
ElixirTutorial.Counter.increment(counter)
ElixirTutorial.Counter.get(counter)
```

#### Task Supervision (`lib/elixir_tutorial/task_supervisor.ex`)
Learn about concurrent task management:
- Task.Supervisor for managing tasks
- Async/await patterns
- Fire-and-forget tasks

```elixir
# Try in iex -S mix:
tasks = [fn -> 1 + 1 end, fn -> 2 * 3 end, fn -> 10 / 2 end]
ElixirTutorial.TaskSupervisor.run_concurrent_tasks(tasks)
```

### 4. Testing

Explore comprehensive testing examples in the `test/` directory:
- Unit testing with ExUnit
- Doctests (tests embedded in documentation)
- Testing GenServers and concurrent code
- Setup and teardown with ExUnit callbacks

```bash
# Run all tests
mix test

# Run tests with detailed output
mix test --trace

# Run specific test file
mix test test/elixir_tutorial_test.exs

# Run tests with coverage
mix test --cover
```

## 🛠️ Project Structure

```
elixir_howto/
├── lib/
│   ├── elixir_tutorial.ex              # Main module with basic examples
│   └── elixir_tutorial/
│       ├── application.ex              # OTP application and supervision tree
│       ├── counter.ex                  # GenServer example
│       ├── data_types.ex               # Data types and operations
│       ├── functions.ex                # Function examples
│       ├── pattern_matching.ex         # Pattern matching examples
│       ├── processes.ex                # Process and message passing examples
│       └── task_supervisor.ex          # Task supervision examples
├── test/
│   ├── test_helper.exs                 # Test configuration
│   ├── elixir_tutorial_test.exs        # Main module tests
│   └── elixir_tutorial/
│       ├── counter_test.exs            # GenServer tests
│       └── data_types_test.exs         # Data types tests
├── config/
│   ├── config.exs                      # Application configuration
│   ├── dev.exs                         # Development environment config
│   ├── test.exs                        # Test environment config
│   └── prod.exs                        # Production environment config
├── mix.exs                             # Project definition and dependencies
├── .formatter.exs                      # Code formatting configuration
├── .gitignore                          # Git ignore rules
├── INSTALL.md                          # Installation instructions
└── README.md                           # This file
```

## 🎯 Key Elixir Concepts Covered

### Functional Programming
- Immutable data structures
- Higher-order functions
- Function composition with pipe operator
- Pattern matching instead of conditionals

### Concurrency & Fault Tolerance
- Actor model with lightweight processes
- Message passing between processes
- Process supervision and fault recovery
- OTP (Open Telecom Platform) patterns

### Pattern Matching
- Destructuring assignments
- Function clause selection
- Guard clauses for additional constraints
- Pin operator for exact matching

### OTP (Open Telecom Platform)
- GenServer for stateful processes
- Supervisor for fault tolerance
- Application structure and lifecycle
- Task supervision for concurrent operations

## 🧪 Interactive Learning

The best way to learn Elixir is by experimenting. Use the interactive shell:

```bash
# Start interactive Elixir with your project loaded
iex -S mix

# Try the examples from the modules
iex> ElixirTutorial.hello("Elixir")
"Hello, Elixir!"

iex> ElixirTutorial.DataTypes.integer_examples()
%{basic: 42, binary: 10, hex: 255, large: 1000000, octal: 420}

iex> ElixirTutorial.Functions.factorial(5)
120

# Start a counter GenServer
iex> {:ok, counter} = ElixirTutorial.Counter.start_link([])
{:ok, #PID<0.123.0>}

iex> ElixirTutorial.Counter.increment(counter)
:ok

iex> ElixirTutorial.Counter.get(counter)
1
```

## 📖 Additional Resources

### Official Documentation
- [Elixir Official Guide](https://elixir-lang.org/getting-started/introduction.html)
- [Elixir Documentation](https://hexdocs.pm/elixir/)
- [Mix & OTP Guide](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html)

### Books
- "Programming Elixir" by Dave Thomas
- "Elixir in Action" by Saša Jurić
- "The Little Elixir & OTP Guidebook" by Benjamin Tan Wei Hao

### Online Resources
- [Elixir School](https://elixirschool.com/)
- [Exercism Elixir Track](https://exercism.org/tracks/elixir)
- [Elixir Forum](https://elixirforum.com/)

## 🤝 Contributing

This is a learning project! Feel free to:
- Add more examples
- Improve documentation
- Fix bugs or issues
- Suggest better explanations

## 📝 License

This project is intended for educational purposes. Feel free to use and modify as needed for learning Elixir!

---

Happy coding with Elixir! 🧪✨
