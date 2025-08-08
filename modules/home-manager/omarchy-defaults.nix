{...}: {
  home.file.".local/share/omarchy/default" = {
    source = ../../omarchy-arch/default;
    recursive = true;
  };
  home.file.".config/omarchy/themes" = {
    source = ../../omarchy-arch/config/themes;
    recursive = true;
  };
}
