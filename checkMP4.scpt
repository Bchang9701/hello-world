on adding folder items to this_folder after receiving the_items
	repeat with each_item in the_items
		set file_info to info for each_item
		if kind of file_info is "folder" then
			display dialog "folder found"
			set the_folder to each_item
			repeat until the name extension of file_info is "mp4"
				tell application "Finder"
					set file_list to files of folder the_folder as alias list
				end tell
				repeat with the_file in file_list
					set file_info to info for the_file
				end repeat
			end repeat
			if the name extension of file_info is "mp4" then
				set old_size to 0
				set new_size to 1
				repeat until new_size = old_size
					set old_size to size of file_info
					delay 1
					set new_size to size of file_info
				end repeat
				log "done"
			end if
			tell application "Finder" to duplicate the_folder to ((path to home folder as text) & "path:to:your:folder") as alias
		end if
	end repeat
end adding folder items to
