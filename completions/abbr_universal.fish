complete -c abbr_universal -f

# Command options
complete -c abbr_universal -n "__fish_use_subcommand" -a "add" -d "Add a new abbreviation"
complete -c abbr_universal -n "__fish_use_subcommand" -a "remove" -d "Remove an existing abbreviation"
complete -c abbr_universal -n "__fish_use_subcommand" -a "--add" -d "Add a new abbreviation"
complete -c abbr_universal -n "__fish_use_subcommand" -a "--remove" -d "Remove an existing abbreviation"
complete -c abbr_universal -n "__fish_use_subcommand" -a "-a" -d "Add a new abbreviation"
complete -c abbr_universal -n "__fish_use_subcommand" -a "-r" -d "Remove an existing abbreviation"

# Existing abbreviations for remove command
complete -c abbr_universal -n "__fish_seen_subcommand_from remove --remove -r" -a "(abbr -l)" -d "Existing abbreviation"