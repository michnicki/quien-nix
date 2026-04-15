# quien-nix

Nix flake for [quien](https://github.com/retlehs/quien), a better WHOIS lookup tool with an interactive TUI.

## Usage

### Run directly
```bash
nix run git+ssh://git@codeberg.org/tmichnicki/quien-nix.git -- example.com
```

### Build
```bash
nix build git+ssh://git@codeberg.org/tmichnicki/quien-nix.git
./result/bin/quien example.com
```

### Development Shell
```bash
nix develop git+ssh://git@codeberg.org/tmichnicki/quien-nix.git
```

## Adding to your configuration

```nix
{
  inputs.quien.url = "git+ssh://git@codeberg.org/tmichnicki/quien-nix.git";

  outputs = { self, nixpkgs, quien, ... }: {
    # Use quien.packages.${system}.default in your configuration
  };
}
```
