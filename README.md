# Neovim Lazy IDE 2025

A modern Neovim configuration built with LazyVim for a powerful IDE experience.

## Prerequisites

- Neovim 0.9.0+ (recommended: latest stable version)
- Git
- Python 3.8+
- Node.js (for LSP servers)

## Installation

### 1. Install/Upgrade Neovim
See [INSTALL.md](INSTALL.md) for detailed installation instructions for your operating system.

### 2. Create Python Virtual Environment
Create a dedicated Python virtual environment for Neovim plugins and LSP features:

```bash
mkdir -p ~/virtualenvs
cd ~/virtualenvs
python3 -m venv nvim-venv
source nvim-venv/bin/activate  # On Windows: nvim-venv\Scripts\activate
pip install pynvim
```

### 3. Install Configuration
Clone this repository and copy the configuration files:

```bash
git clone https://github.com/oscarmuya/lazyvim.git
cd lazyvim

# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# Create nvim config directory and copy files
mkdir -p ~/.config/nvim
cp -r * ~/.config/nvim/
```


### 4. First Launch
Start Neovim and let Lazy.nvim install all plugins automatically:

```bash
nvim
```

## Configuration Structure


```
├── lua/
│   ├── plugins/      # Plugin configurations
│   ├── keymaps.lua   # Key mappings
│   ├── options.lua   # Neovim options
│   └── init.lua      # Lua initialization
├── init.lua          # Main configuration entry point
└── lazy-lock.json    # Plugin version lockfile
```


## Customization

Add your preferred configurations by editing files in `~/.config/nvim/lua/`. The configuration is modular and easy to extend.

## Features

-  Fast startup with lazy loading
-  Beautiful UI with modern colorschemes
-  File explorer integration
-  Fuzzy finding and search
-  LSP support for multiple languages
-  Integrated debugging
-  Autocompletion and snippets

## Troubleshooting

If you encounter issues:
1. Ensure all prerequisites are installed
2. Check `:checkhealth` in Neovim
3. Verify Python virtual environment is properly configured
4. Review plugin installation with `:Lazy`

## Contributing

Feel free to open issues or submit pull requests for improvements.

## License

This configuration is open source and available under the [MIT License](LICENSE).

