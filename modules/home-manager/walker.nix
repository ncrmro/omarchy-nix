{
  config,
  pkgs,
  ...
}: {
  # Walker configuration
  home.file = {
    ".config/walker/config.toml" = {
      text = ''
        app_launch_prefix = "uwsm app -- "
        terminal_title_flag = ""
        locale = ""
        close_when_open = true
        theme = "omarchy-default"
        theme_base = []
        theme_location = ["~/.config/walker/themes/"]
        monitor = ""
        hotreload_theme = true
        as_window = false
        timeout = 0
        disable_click_to_close = false
        force_keyboard_focus = true

        [keys]
        accept_typeahead = ["tab"]
        trigger_labels = "lalt"
        next = ["down"]
        prev = ["up"]
        close = ["esc"]
        remove_from_history = ["shift backspace"]
        resume_query = ["ctrl r"]
        toggle_exact_search = ["ctrl m"]

        [keys.activation_modifiers]
        keep_open = "shift"
        alternate = "alt"

        [keys.ai]
        clear_session = ["ctrl x"]
        copy_last_response = ["ctrl c"]
        resume_session = ["ctrl r"]
        run_last_responstruee = ["ctrl e"]

        [events]
        on_activate = ""
        on_selection = ""
        on_exit = ""
        on_launch = ""
        on_query_change = ""

        [list]
        dynamic_sub = true
        keyboard_scroll_style = "emacs"
        max_entries = 200
        show_initial_entries = true
        single_click = true
        visibility_threshold = 20
        placeholder = "No Results"

        [search]
        argument_delimiter = "#"
        placeholder = " Search..."
        delay = 0
        resume_last_query = false

        [activation_mode]
        labels = "jkl;asdf"

        [builtins.hyprland_keybinds]
        show_sub_when_single = true
        path = "~/.config/hypr/hyprland.conf"
        weight = 5
        name = "hyprland_keybinds"
        placeholder = "Hyprland Keybinds"
        switcher_only = true
        hidden = true

        [builtins.applications]
        weight = 5
        name = "applications"
        placeholder = " Search..."
        prioritize_new = false
        hide_actions_with_empty_query = true
        context_aware = false
        refresh = true
        show_sub_when_single = false
        show_icon_when_single = true
        show_generic = true
        history = false
        icon = ""
        hidden = true

        [builtins.applications.actions]
        enabled = false
        hide_category = true
        hide_without_query = true

        [builtins.bookmarks]
        weight = 5
        placeholder = "Bookmarks"
        name = "bookmarks"
        icon = "bookmark"
        switcher_only = true
        hidden = true

        [[builtins.bookmarks.entries]]
        label = "Walker"
        url = "https://github.com/abenz1267/walker"
        keywords = ["walker", "github"]

        [[builtins.bookmarks.entries]]
        label = "Omarchy - Github"
        url = "https://github.com/basecamp/omarchy"
        keywords = ["omarchy", "github"]

        [[builtins.bookmarks.entries]]
        label = "Omarchy Manual"
        url = "https://manuals.omamix.org/2/the-omarchy-manual"
        keywords = ["omarchy"]

        [builtins.xdph_picker]
        hidden = true
        weight = 5
        placeholder = "Screen/Window Picker"
        show_sub_when_single = true
        name = "xdphpicker"
        switcher_only = true

        [builtins.calc]
        require_number = true
        weight = 5
        name = "Calculator"
        icon = "accessories-calculator"
        placeholder = "Calculator"
        min_chars = 3
        prefix = "="

        [builtins.windows]
        weight = 5
        icon = "view-restore"
        name = "windows"
        placeholder = "Windows"
        show_icon_when_single = true
        switcher_only = true
        hidden = true

        [builtins.clipboard]
        always_put_new_on_top = true
        exec = "wl-copy"
        weight = 5
        name = "clipboard"
        avoid_line_breaks = true
        placeholder = "Clipboard"
        image_height = 300
        max_entries = 10
        switcher_only = true
        hidden = true

        [builtins.commands]
        weight = 5
        icon = "utilities-terminal"
        switcher_only = true
        name = "commands"
        placeholder = "Commands"
        hidden = true

        [builtins.custom_commands]
        weight = 5
        icon = "utilities-terminal"
        name = "custom_commands"
        placeholder = "Custom Commands"
        hidden = true

        [builtins.emojis]
        exec = "wl-copy"
        weight = 5
        name = "Emojis"
        placeholder = "Emojis"
        switcher_only = true
        history = true
        typeahead = true
        show_unqualified = false
        prefix = ":"

        [builtins.symbols]
        after_copy = ""
        weight = 5
        name = "symbols"
        placeholder = "Symbols"
        switcher_only = true
        history = true
        typeahead = true
        hidden = true

        [builtins.finder]
        use_fd = true
        fd_flags = "--ignore-vcs --type file --type directory"
        cmd_alt = "xdg-open $(dirname ~/%RESULT%)"
        weight = 5
        icon = "file"
        name = "Finder"
        placeholder = "Finder"
        switcher_only = true
        ignore_gitignore = true
        refresh = true
        concurrency = 8
        show_icon_when_single = true
        preview_images = true
        hidden = false
        prefix = "."

        [builtins.runner]
        eager_loading = true
        weight = 5
        icon = "utilities-terminal"
        name = "runner"
        placeholder = "Runner"
        typeahead = true
        history = true
        generic_entry = false
        shell_config = ""
        refresh = true
        use_fd = false
        switcher_only = true
        hidden = true

        [builtins.ssh]
        weight = 5
        icon = "preferences-system-network"
        name = "ssh"
        placeholder = "SSH"
        switcher_only = true
        history = true
        refresh = true
        hidden = true

        [builtins.switcher]
        weight = 5
        name = "switcher"
        placeholder = "Switcher"
        prefix = "/"

        [builtins.websearch]
        keep_selection = true
        weight = 5
        icon = "applications-internet"
        name = "websearch"
        placeholder = "Websearch"
        switcher_only = true
        hidden = true

        [[builtins.websearch.entries]]
        name = "Google"
        url = "https://www.google.com/search?q=%TERM%"

        [[builtins.websearch.entries]]
        name = "DuckDuckGo"
        url = "https://duckduckgo.com/?q=%TERM%"
        switcher_only = true

        [[builtins.websearch.entries]]
        name = "Ecosia"
        url = "https://www.ecosia.org/search?q=%TERM%"
        switcher_only = true

        [[builtins.websearch.entries]]
        name = "Yandex"
        url = "https://yandex.com/search/?text=%TERM%"
        switcher_only = true

        [builtins.dmenu]
        hidden = true
        weight = 5
        name = "dmenu"
        placeholder = "Dmenu"
        switcher_only = true
        show_icon_when_single = true

        [builtins.translation]
        delay = 1000
        weight = 5
        name = "translation"
        icon = "accessories-dictionary"
        placeholder = "Translation"
        switcher_only = true
        provider = "googlefree"
        hidden = true
      '';
    };

    # Walker theme configuration
    ".config/walker/themes/omarchy-default.toml" = {
      text = ''
        [ui.window.box]
        width = 664
        min_width = 664
        max_width = 664
        height = 396
        min_height = 396
        max_height = 396

        # List constraints are critical - without these, the window shrinks when empty
        [ui.window.box.scroll.list]
        height = 300
        min_height = 300
        max_height = 300

        [ui.window.box.scroll.list.item.icon]
        pixel_size = 40
      '';
    };

    # Walker theme CSS based on color scheme
    ".config/walker/themes/omarchy-default.css" = {
      text = ''
        /* Reset all elements */
        #window,
        #box,
        #search,
        #password,
        #input,
        #prompt,
        #clear,
        #typeahead,
        #list,
        child,
        scrollbar,
        slider,
        #item,
        #text,
        #label,
        #sub,
        #activationlabel {
          all: unset;
        }

        * {
          font-family: 'CaskaydiaMono Nerd Font', monospace;
          font-size: 18px;
        }

        /* Window */
        #window {
          background: transparent;
          color: #${config.colorScheme.palette.base05};
        }

        /* Main box container */
        #box {
          background: alpha(#${config.colorScheme.palette.base00}, 0.95);
          padding: 20px;
          border: 2px solid #${config.colorScheme.palette.base05};
          border-radius: 0px;
        }

        /* Search container */
        #search {
          background: #${config.colorScheme.palette.base00};
          padding: 10px;
          margin-bottom: 0;
        }

        /* Hide prompt icon */
        #prompt {
          opacity: 0;
          min-width: 0;
          margin: 0;
        }

        /* Hide clear button */
        #clear {
          opacity: 0;
          min-width: 0;
        }

        /* Input field */
        #input {
          background: none;
          color: #${config.colorScheme.palette.base05};
          padding: 0;
        }

        #input placeholder {
          opacity: 0.5;
          color: #${config.colorScheme.palette.base05};
        }

        /* Hide typeahead */
        #typeahead {
          opacity: 0;
        }

        /* List */
        #list {
          background: transparent;
        }

        /* List items */
        child {
          padding: 0px 12px;
          background: transparent;
          border-radius: 0;
        }

        child:selected,
        child:hover {
          background: transparent;
        }

        /* Item layout */
        #item {
          padding: 0;
        }

        /* Icon */
        #icon {
          margin-right: 10px;
          -gtk-icon-transform: scale(0.7);
        }

        /* Text */
        #text {
          color: #${config.colorScheme.palette.base05};
          padding: 14px 0;
        }

        #label {
          font-weight: normal;
        }

        /* Selected state */
        child:selected #text,
        child:selected #label,
        child:hover #text,
        child:hover #label {
          color: #${config.colorScheme.palette.base0D};
        }

        /* Hide sub text */
        #sub {
          opacity: 0;
          font-size: 0;
          min-height: 0;
        }

        /* Hide activation label */
        #activationlabel {
          opacity: 0;
          min-width: 0;
        }

        /* Scrollbar styling */
        scrollbar {
          opacity: 0;
        }

        /* Hide spinner */
        #spinner {
          opacity: 0;
        }

        /* Hide AI elements */
        #aiScroll,
        #aiList,
        .aiItem {
          opacity: 0;
          min-height: 0;
        }

        /* Bar entry (switcher) */
        #bar {
          opacity: 0;
          min-height: 0;
        }

        .barentry {
          opacity: 0;
        }
      '';
    };
  };
} 