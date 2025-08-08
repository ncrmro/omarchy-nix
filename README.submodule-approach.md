# Omarchy Nix Submodule Approach

This document outlines the approach for integrating the upstream [omarchy](https://github.com/omarchy/omarchy) configuration as a Git submodule within this Nix flake, while using Home Manager for declarative configuration management.

## Overview

The goal is to:
1. Add the upstream omarchy repository as a Git submodule
2. Use Home Manager to manage default configurations and themes
3. Allow declarative overrides through standard Home Manager configuration
4. Maintain compatibility with the upstream omarchy while leveraging Nix's declarative benefits

## Architecture

### Submodule Integration

The upstream omarchy will be added as a Git submodule at `omarchy-arch/` (already present). This provides:

- **Upstream tracking**: Easy updates from the main omarchy repository
- **Version pinning**: Specific commits can be locked for stability
- **Selective adoption**: Choose which parts of omarchy to integrate

### Home Manager Integration

Home Manager will be used to:

1. **Expose omarchy defaults**: Create modules that read from the submodule's configuration files
2. **Provide declarative overrides**: Allow users to override any configuration through Nix expressions
3. **Theme management**: Expose omarchy themes as selectable options
4. **Service management**: Handle systemd services, autostart applications, etc.

## Implementation Plan

### 1. Submodule Setup

```bash
# Add omarchy as a submodule (if not already present)
git submodule add https://github.com/omarchy/omarchy.git omarchy-arch
git submodule update --init --recursive
```

### 2. Home Manager Module Structure

```
modules/home-manager/
├── omarchy-defaults.nix    # Main omarchy integration module
├── themes.nix             # Theme selection and management
├── hyprland.nix           # Hyprland-specific configurations
├── waybar.nix            # Waybar configuration with omarchy defaults
├── fonts.nix             # Font management
└── ...                   # Other component modules
```

### 3. Configuration Flow

1. **Base Configuration**: Read defaults from `omarchy-arch/` submodule
2. **Theme Application**: Apply selected theme from `omarchy-arch/themes/`
3. **User Overrides**: Allow declarative overrides in user's Home Manager config
4. **File Generation**: Generate final configuration files with merged settings

### 4. Theme Management

Themes will be exposed as:

```nix
{
  omarchy = {
    enable = true;
    theme = "tokyo-night";  # Selects from omarchy-arch/themes/
    
    # Declarative overrides
    hyprland.extraConfig = ''
      # Custom Hyprland configuration
    '';
    
    waybar.settings = {
      # Custom waybar settings that merge with theme defaults
    };
  };
}
```

### 5. Module Benefits

- **Declarative**: All configuration in Nix expressions
- **Reproducible**: Identical environments across machines
- **Modular**: Enable/disable components as needed
- **Overridable**: Any setting can be declaratively overridden
- **Upstream compatible**: Easy to pull updates from omarchy

## Configuration Examples

### Basic Setup

```nix
# flake.nix or home.nix
{
  omarchy = {
    enable = true;
    theme = "tokyo-night";
    
    # Enable specific components
    components = {
      hyprland = true;
      waybar = true;
      mako = true;
      wofi = true;
    };
  };
}
```

### Advanced Overrides

```nix
{
  omarchy = {
    enable = true;
    theme = "gruvbox";
    
    # Override theme wallpaper
    wallpaper = ./custom-wallpaper.jpg;
    
    # Extend Hyprland configuration
    hyprland.extraConfig = ''
      bind = SUPER, T, exec, alacritty
    '';
    
    # Customize waybar modules
    waybar.settings.modules-left = [ "hyprland/workspaces" "custom/weather" ];
  };
}
```

## Migration Path

For existing omarchy users:

1. **Backup current config**: `cp -r ~/.config ~/.config.backup`
2. **Enable omarchy module**: Add to Home Manager configuration
3. **Apply configuration**: `home-manager switch`
4. **Customize as needed**: Add declarative overrides for any custom settings

## Development Workflow

### Updating Upstream

```bash
# Update submodule to latest upstream
cd omarchy-arch
git pull origin main
cd ..
git add omarchy-arch
git commit -m "Update omarchy submodule"
```

### Testing Changes

```bash
# Test configuration changes
home-manager switch --flake .#your-hostname

# Rollback if needed
home-manager generations
home-manager switch --switch-generation 123
```

## Benefits of This Approach

1. **Best of both worlds**: Combines omarchy's curated configurations with Nix's declarative power
2. **Upstream compatibility**: Easy to incorporate omarchy updates
3. **Customization**: Full control over any configuration aspect
4. **Reproducibility**: Identical setups across multiple machines
5. **Modularity**: Pick and choose which omarchy components to use
6. **Version control**: All configuration changes tracked in Git

## Future Enhancements

- **Automatic theme switching**: Based on time of day or other conditions
- **Custom theme creation**: Tools to generate new themes
- **Component templates**: Easy creation of new omarchy-compatible modules
- **Integration testing**: Automated testing of configuration combinations
