inputs: {config, pkgs, lib, ...}: let
  cfg = config.omarchy;
in {
  home.file.".local/share/omarchy/default" = {
    source = ../../omarchy-arch/default;
    recursive = true;
  };
  home.file.".config/omarchy/themes" = {
    source = ../../omarchy-arch/themes;
    recursive = true;
  };
  home.activation.system-link-default-theme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # Create necessary directories
    mkdir -p "${config.xdg.configHome}/omarchy/current"
    mkdir -p "${config.xdg.configHome}/btop/themes"
    mkdir -p "${config.xdg.configHome}/mako"
    mkdir -p "${config.xdg.configHome}/nvim/lua/plugins"
    
    # Define paths
    THEMES_DIR="${config.xdg.configHome}/omarchy/themes"
    CURRENT_THEME_DIR="${config.xdg.configHome}/omarchy/current/theme"
    SELECTED_THEME="${cfg.theme}"
    THEME_PATH="$THEMES_DIR/$SELECTED_THEME"
    
    # Check if the current theme symlink points to the correct theme
    if [[ ! -L "$CURRENT_THEME_DIR" ]] || [[ "$(readlink "$CURRENT_THEME_DIR")" != "$THEME_PATH" ]]; then
      echo "Linking theme: $SELECTED_THEME"
      
      # Check if the selected theme exists
      if [[ -d "$THEME_PATH" ]]; then
        # Create the main theme symlink
        $DRY_RUN_CMD ln -nsf "$THEME_PATH" "$CURRENT_THEME_DIR"
        
        # Create specific app symlinks for current theme if they exist
        if [[ -f "$THEME_PATH/neovim.lua" ]]; then
          $DRY_RUN_CMD ln -nsf "$CURRENT_THEME_DIR/neovim.lua" "${config.xdg.configHome}/nvim/lua/plugins/theme.lua"
        fi
        
        if [[ -f "$THEME_PATH/btop.theme" ]]; then
          $DRY_RUN_CMD ln -nsf "$CURRENT_THEME_DIR/btop.theme" "${config.xdg.configHome}/btop/themes/current.theme"
        fi
        
        if [[ -f "$THEME_PATH/mako.ini" ]]; then
          $DRY_RUN_CMD ln -nsf "$CURRENT_THEME_DIR/mako.ini" "${config.xdg.configHome}/mako/config"
        fi
        
        echo "Theme $SELECTED_THEME linked successfully"
      else
        echo "Warning: Theme '$SELECTED_THEME' not found at $THEME_PATH"
      fi
    else
      echo "Theme $SELECTED_THEME already linked correctly"
    fi
  '';
}
