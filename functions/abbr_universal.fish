function abbr_universal
  set -l abbr_command $argv[1]
  set -l abbr_name $argv[2]
  set -l abbr_value $argv[3..]
  set -l abbr_value (string join -- ' ' $abbr_value)

  # Escape the value
  set -l escaped_value (string escape -- $abbr_value)

  # Check parameters
  if begin; test -z "$abbr_command"; or test -z "$abbr_name"; end
    echo "Usage: abbr_universal <add|remove> <abbreviation_name> [abbreviation_value]"
    return 1
  end

  # Check value parameter for add command
  if begin; test "$abbr_command" = "add"; or test "$abbr_command" = "--add"; or test "$abbr_command" = "-a"; end
    if test -z "$abbr_value"
      echo "Usage: abbr_universal add <abbreviation_name> <abbreviation_value>"
      return 1
    end
  end

  # Get config.fish file path
  set -l config_file $__fish_config_dir/config.fish

  # Ensure config.fish file exists
  if not test -f $config_file
    mkdir -p (dirname $config_file)
    touch $config_file
  end

  switch $abbr_command
    case "add" "--add" "-a"
      # Check if file is regular
      if test -f $config_file
        # Remove existing abbreviation if it exists
        if grep -q "^abbr -a $abbr_name " $config_file
          set -l temp_file (mktemp)
          grep -v "^abbr -a $abbr_name " $config_file > $temp_file
          mv $temp_file $config_file
          abbr -e $abbr_name
        end

        # Create temporary file
        set -l temp_file (mktemp)
        # Find # abbr comment line
        set -l abbr_section (grep -n "^# abbr" $config_file | cut -d: -f1)
        if test -n "$abbr_section"
          # Update content using temporary file
          head -n $abbr_section $config_file > $temp_file
          echo "abbr -a $abbr_name $escaped_value" >> $temp_file
          tail -n +$(math $abbr_section + 1) $config_file >> $temp_file
        else
          # If no comment line found, add comment and abbreviation
          cat $config_file > $temp_file
          echo "\n# abbr" >> $temp_file
          echo "abbr -a $abbr_name $escaped_value" >> $temp_file
        end
        # Move temporary file to target location
        mv $temp_file $config_file
      else
        echo "Error: $config_file is not a regular file"
        return 1
      end
      # Apply abbreviation immediately
      abbr -a $abbr_name $escaped_value
      # Reload configuration to ensure abbreviation works in current session
      source $config_file
      echo "Added/Updated abbreviation: $abbr_name -> $abbr_value"

    case "remove" "--remove" "-r"
      if begin; test -f $config_file; and grep -q "^abbr -a $abbr_name " $config_file; end
        # Create temporary file and filter out the line to be removed
        set -l temp_file (mktemp)
        grep -v "^abbr -a $abbr_name " $config_file > $temp_file
        # Move temporary file to target location
        mv $temp_file $config_file
        abbr -e $abbr_name
        echo "Removed abbreviation: $abbr_name"
      else if not test -f $config_file
        echo "Error: $config_file is not a regular file"
        return 1
      else
        echo "Abbreviation '$abbr_name' not found"
      end

    case '*'
      echo "Unknown command: $abbr_command"
      echo "Usage: abbr_universal <add|remove> <abbreviation_name> <abbreviation_value>"
      return 1
  end
end