# Installing Elixir on macOS

## Option 1: Using Homebrew (Recommended)

```bash
# Install Homebrew if you haven't already
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Elixir (this will also install Erlang)
brew install elixir
```

## Option 2: Using asdf (Version Manager)

```bash
# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Add to your shell profile (.zshrc, .bash_profile, etc.)
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc

# Restart your terminal or source your profile
source ~/.zshrc

# Install Erlang and Elixir plugins
asdf plugin add erlang
asdf plugin add elixir

# Install latest versions
asdf install erlang latest
asdf install elixir latest

# Set global versions
asdf global erlang latest
asdf global elixir latest
```

## Verify Installation

After installation, verify that Elixir is working:

```bash
# Check Elixir version
elixir --version

# Check if Mix (build tool) is available
mix --version

# Start interactive Elixir shell
iex
```

You should see output similar to:
```
Erlang/OTP 26 [erts-14.2.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns]

Elixir 1.15.7 (compiled with Erlang/OTP 26)
```

## Next Steps

Once Elixir is installed, you can:
1. Create a new Mix project: `mix new my_project`
2. Navigate to the project: `cd my_project`
3. Run tests: `mix test`
4. Start interactive shell with project loaded: `iex -S mix`

Please install Elixir using one of the methods above, then we can proceed with creating and exploring the sample project!
