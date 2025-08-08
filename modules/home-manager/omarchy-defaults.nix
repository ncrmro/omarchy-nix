{...}: {
  home.file.".local/share/omarchy/default" = {
    source = ../../omarchy-arch/default;
    recursive = true;
  };
}
