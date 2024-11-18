#!/bin/bash

set -e # Exit on error

echo "Starting installation..."

# Ensure required tools are installed
install_dependencies() {
  echo "Installing dependencies..."

  # Install Homebrew (Linuxbrew)
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Linuxbrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  # Install asdf
  if ! command -v asdf >/dev/null 2>&1; then
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
  fi
  . "$HOME/.asdf/asdf.sh"
  . "$HOME/.asdf/completions/asdf.bash"

  # Install fzf
  if ! command -v fzf >/dev/null 2>&1; then
    echo "Installing fzf..."
    brew install fzf
  fi

  # Install starship
  if ! command -v starship >/dev/null 2>&1; then
    echo "Installing starship..."
    brew install starship
  fi

  # Install rustup
  if ! command -v rustup >/dev/null 2>&1; then
    echo "Installing rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
  fi

  # Install tmux plugins
  if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    echo "Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
  fi

  echo "Dependencies installed."
}

# Create symlinks for dotfiles
create_symlinks() {
  echo "Creating symlinks..."

  DOTFILES_DIR="$HOME/dotfiles"

  # Symlink .bashrc
  ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

  # Symlink .config/nvim
  mkdir -p "$HOME/.config"
  ln -sf "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

  # Symlink .config/tmux
  ln -sf "$DOTFILES_DIR/.config/tmux" "$HOME/.config/tmux"

  echo "Symlinks created."
}

# Final steps and wrap-up
final_steps() {
  echo "Running final setup steps..."

  # Set up fzf keybindings if not already installed
  if [ ! -f "$HOME/.fzf.bash" ]; then
    echo "Setting up fzf keybindings and completion..."
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc
  fi

  echo "Installation complete! Remember to reload your shell or restart your terminal."
}

# Run all functions
install_dependencies
create_symlinks
final_steps
