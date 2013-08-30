# PART 2 BEGIN

function press_enter
{
	echo ""
	echo -n "Press Return to continue"
	read
}

function exit_status
{
        export OUT=$?
        if [ $OUT -eq 0 ]; then
        echo "[OK] Exit status was $OUT"
        else
        echo "[ERROR] Something might have gone wrong. Exit status was $OUT"
        fi
}

TODAYSDATE=`date +%d-%b-%Y.%H%M`

echo ""
echo "--------------------------------------------------------"
echo "Let's work on the semi-automated tasks next."
echo "You'll need to do a little more work on these."
echo "Recommend you fire up a new terminal window to prepare."
echo ""
read -p "If you're ready to continue, hit 'Return'."
echo "--------------------------------------------------------"
echo ""


echo "---------------------------"
echo "[STIG ID] SV-38520r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Security auditing must be enabled." 
echo "[FIX] Verify the following line exists: AUDIT=-YES- If the value is not YES, this is a finding. Cancel out of file without saving."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to run the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/hostconfig | grep AUDIT ;;
		2 ) echo "AUDIT=YES-" >> /etc/hostconfig ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38766r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] For systems using DNS resolution, at least two name servers must be configured."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/resolv.conf | grep nameserver ; exit_status ;;
		2 ) echo "[FIX] If less than two lines are returned that are not commented out, this is a finding. Edit the /etc/resolv.conf and add additional 'nameserver' lines until at least two are present." ; press_enter ;;
		3 ) exit ;;
		
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-37848r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If an account has a UID of "0", it has root authority."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) grep :0 /etc/passwd ; exit_status ;;
		2 ) echo "[FIX] Edit /etc/passwd and change UID of duplicate root account to unused UID." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-38187r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All files and directories must have a valid group owner."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find / -nogroup -print ; exit_status ;;
		2 ) echo "[FIX] Use the following command to change the group owner to [staff] for each file without a valid group owner" ; echo "find / -nogroup -print0 | xargs -0 chgrp staff" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-38181r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All files and directories must have a valid owner."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find / -nouser ; exit_status ;;
		2 ) echo "[FIX] Review the results. If any files do not have a valid owner, this is a finding." ; echo "find / -nouser -print0 | xargs -0 chown cjtf-hoa" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-37882r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All network services daemon files must have mode 0755 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find /usr/sbin -type f -perm +022 ; exit_status ;;
		2 ) echo "[FIX] Use the following command to change the mode of the network services daemon." ; echo "find /usr/sbin -type f -perm +022 -print0 | xargs -0 chmod go-w" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-37987r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All system command files must have mode 0755 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find /usr/bin -type f -perm +022 ; exit_status ;;
		2 ) echo "[FIX] If any file listed is world or group-writable [either or both of the two lowest order digits contain a "2", "3", or "6"], this is a finding." ; echo "find /usr/bin -type f -perm +022 -print0 | xargs -0 chmod go-w" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-38072r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All system command files must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -la /usr/sbin ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding." ; echo "chmod -N /path/to/file" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37988r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All system files, programs, and directories must be owned by a system account."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lLa /usr/bin ; exit_status ;;
		2 ) echo "[FIX] If any of the system files, programs, or directories are not owned by a system account, this is a finding." ; echo "chown root /usr/bin/filename" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37989r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System files, programs, and directories must be group-owned by a system group."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lLa /usr/bin ; exit_status ;;
		2 ) echo "[FIX] If any system file, program, or directory is not owned by a system group, this is a finding." ; echo "chgrp wheel /usr/bin/filename" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37890r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System log files must have mode 0640 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lL /var/log ; exit_status ;;
		2 ) echo "[FIX] If any of the log files have modes more permissive than 0640, this is a finding." ; echo "chmod -R 0640 /var/log*" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37911r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Library files must have mode 0755 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lLR /usr/lib ; exit_status ;;
		2 ) echo "[FIX] If any of the library files have a mode more permissive than 0755, this is a finding." ; echo "chmod -R 0755 /usr/lib" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38094r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] User home directories must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -al /Users ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+' the file/directory has an extended ACL, this is a finding. The following command will remove any and all ACLs from files and folders in the Users directory" ; echo "chmod -R -N /Users" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38182r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All files and directories contained in interactive user home directories must be owned by the home directory's owner. For each user in the /etc/passwd file, check for the presence of files and directories within the user's home directory not owned by the home directory owner."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to find out how to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "No way devised to check for this yet. Can fix, though." ;;
		2 ) echo "[FIX] Change the ownership of files and directories in user home directories to the owner of the home directory." ; echo "chown -R username /Users/username" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38215r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All files and directories contained in user home directories must be group-owned by a group of which the home directory's owner is a member. Check the contents of user home directories for files group-owned by a group where the home directory's owner is not a member."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "Listing user accounts:" ; cut -d : -f 1/etc/passwd ; exit_status ;;
		2 ) echo "For each user account, get a list of GIDs for files in the user's home directory" ; "find ~username -printf %G\\n | sort | unique" ; exit_status ; echo "Obtain the list of GIDs where the user is a member" ; echo "id -G username" ; echo "[FIX] Check the GID lists. If there are GIDs in the file list not present in the user list, this is a finding." ; echo "chgrp [group with user as member] [file with bad group ownership]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38095r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All files and directories contained in user home directories must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cut -d : -f 6 /etc/passwd | xargs -n1 -IDIR ls -alLR DIR ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; echo "chmod -N [user file with extended ACL]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38013r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All run control scripts must have mode 0755 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lL /etc/rc* ; exit_status ;;
		2 ) echo "[FIX] Set the mode of the run control script file." ; echo "chmod 755 /path/to/control_script"  ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38096r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All run control scripts must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lL /etc/rc* /etc/init.d ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; echo "chmod -N /path/to/control_script" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38256r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Run control scripts' executable search paths must contain only absolute paths."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) grep -r PATH /etc/rc* /etc/init.d ; exit_status ;;
		2 ) echo "[FIX] Edit the run control script and remove the relative path entry from the executable search path variable." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38010r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All local initialization files must be owned by the user or root."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to find out how to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "ls -al /$usershomedirectory/.login" ; echo "ls -al /$usershomedirectory/.cschrc" ; echo "ls -al /$usershomedirectory/.logout" ; echo "ls -al /$usershomedirectory/.profile" ; echo "ls -al /$usershomedirectory/.bash_profile" ;" ; echo "ls -al /$usershomedirectory/.bashrc" ; echo "ls -al /$usershomedirectory/.bash_logout" ; echo "ls -al /$usershomedirectory/.env" ; echo "ls -al /$usershomedirectory/.dtprofile" ;" ; echo "ls -al /$usershomedirectory/.dispatch" ; echo "ls -al /$usershomedirectory/.emacs" ; echo "ls -al /$usershomedirectory/.exrc" ; echo "find /$usershomedirectory/.dt ! -fstype nfs ! -user $username -exec ls -ld {} \;" ; exit_status ;;
		2 ) echo "[FIX] If local initialization files are not owned by the home directory's user, this is a finding. Examine each user’s home directory and verify all filenames begin with '.' are owned by the owner of the directory or root. If they are not, use the chown command to change the owner to the user and research the reasons why the owners were not assigned as required." ; echo "chown $username /directory/filename" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38014r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All shell files must be owned by root or bin."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/shells | xargs -n1 ls -l ; exit_status ;;
		2 ) echo "[FIX] If any shell is not owned by root or bin, this is a finding." ; echo "chown root [shell]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38015r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All shell files must have mode 0755 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/shells | xargs -n1 ls -l ; exit_status ; echo "If /etc/shells exists, check the group ownership of each shell referenced. Otherwise, check any shells found on the system." ; find / -name ""*sh"" | xargs -n1 ls -l ; exit_status ;;
		2 ) echo "[FIX] If a shell has a mode more permissive than 0755, this is a finding." ; echo "chmod 0755 [shell]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38098r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All shell files must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/shells | xargs -n1 ls -lL ; exit_status ; echo "If /etc/shells exists, check the permissions of each shell referenced. Otherwise, check any shells found on the system." ; find / -name ""*sh"" | xargs -n1 ls -lL ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; "chmod -N [shell file with extended ACL]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38017r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Device files and directories must only be writable by users with a system account or as configured by the vendor."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find / -perm -2 -a \( -type b -o -type c \) ] devicelist ; exit_status ; echo "[FIX] Check the permissions on the directories above subdirectories in the devicelist file. If any of the device files or their parent directories are world-writable, except device files specifically intended to be world-writable such as /dev/null, this is a finding." ; exit_status ;;
		2 ) echo "chmod o-w [device file]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38100r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Audio devices must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lL /dev/audio* /dev/snd/* ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; echo "chmod -N [audit file with extended ACL]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37991r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The sticky bit must be set on all public directories."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find / -type d -perm -002 -exec ls -ld {} \;  ; exit_status ;;
		2 ) echo "[FIX] Review the results. If any public directories do not have the sticky bit set, this is a finding." ; echo "chmod 1777 /tmp" ; exit_status ; echo "chmod 1777 /publicdirmissingstickybit" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37993r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All public directories must be owned by root or an application account."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) find / -type d -perm -1002 -exec ls -ld {} \; ; exit_status ;;
		2 ) echo "[FIX] If any public directory is not owned by root or an application user, this is a finding." ; echo "chown root /tmp" ; exit_status ; echo "chown root /publicdir" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38622r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System audit logs must have mode 0640 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -l /etc/auditd ; exit_status ;;
		2 ) echo "[FIX] If any audit log file has a mode more permissive than 0640, this is a finding." ; echo "chmod 0640 [audit log file]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38102r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All system audit files must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) grep ""^log_file"" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs ls ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; echo "chmod -N [audit file with extended ACL]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38103r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System audit tool executables must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -l /sbin/auditctl /sbin/auditd /sbin/ausearch /sbin/aureport /sbin/autrace /sbin/audispd ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding." ; echo "chmod -N [audit tool file with extended ACL]" ;;
		3 ) exit ;;
	esac
done 

echo "---------------------------"
echo "[STIG ID] SV-38107r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Crontab files must be group-owned by root, cron, or the crontab creator's primary group."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lL /usr/lib/cron ; exit_status ; ls -lL /etc/cron.d /etc/crontab /etc/cron.daily /etc/cron.hourly /etc/cron.monthly /etc/cron.weekly ; exit_status ; ls -lL /etc/cron*|grep -v deny ; exit_status ;;
		2 ) echo "[FIX] If the group-owner is not root or the crontab owner's primary group, this is a finding." ; echo "chgrp wheel [crontab file]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38110r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Crontab files must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -lL /usr/lib/cron ; exit_status ; ls -lL /etc/cron*|grep -v deny ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; echo "chmod -N [crontab file]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38112r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Cron and crontab directories must not have extended ACLs."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -ld /usr/lib/cron ; exit_status ; ls -ld /etc/cron*|grep -v deny ; exit_status ;;
		2 ) echo "[FIX] If the permissions include a '+', the directory has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding." ; "chmod -N [crontab directory]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38022r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] "At" jobs must not set the umask to a value less restrictive than 077."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK/get additional information."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls /var/spool/at ; exit_status ; echo "If no "at" jobs are present, this is not applicable. To determine if any of the "at" jobs or any scripts referenced execute the "umask" command check for any umask setting more permissive than 077:" ; echo "rep umask /var/at/[at job or referenced script]" ; exit_status ;;
		2 ) echo "[FIX] If any "at" job or referenced script sets umask to a value more permissive than 077, this is a finding." ; echo "Edit "at" jobs or referenced scripts to remove "umask" commands setting umask to a value less restrictive than 077." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38195r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must be configured to store any process core dumps in a specific, centralized directory."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /proc/sys/kernel/core_pattern ; exit_status ; echo "[FIX] If the parameter is not an absolute path [does not start with a slash "/"], this is a finding." ;;
		2 ) echo "Edit the /etc/sysctl.conf file; and set the [add if necessary] kernel/core_pattern to an absolute path ending with a file name prefix, such as "/var/core/core"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38120r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The centralized process core dump data directory must be owned by root."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /proc/sys/kernel/core_pattern|xargs -n1 -IPATTERN dirname PATTERN ; exit_status ; echo "Check the existence and ownership of the directory." ; ls -lLd [core file directory] ; exit_status ;;
		2 ) echo "[FIX] If the directory does not exist or is not owned by root, this is a finding. If the core file directory does not exist it must be created." ; echo "mkdir -p [core file directory]" ; echo "If necessary, change the owner of the core file directory." ; echo "chown root [core file directory]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38121r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The centralized process core dump data directory must be group-owned by root, bin, sys, or system."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "ls -lL [core file directory]" ; exit_status ;;
		2 ) echo "[FIX] If the directory is not group-owned by root, bin, sys, or system this is a finding." ; echo "chgrp wheel [core file directory]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38197r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The centralized process core dump data directory must have mode 0700 or less permissive."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /proc/sys/kernel/core_pattern|xargs -n1 -IPATTERN dirname PATTERN ; exit_status ; echo "Check the permissions of the directory." ; echo "ls -lL [core file directory]" ;;
		2 ) echo "[FIX] If the directory has a mode more permissive than 0700, this is a finding." ; echo "chmod 0700 [core file directory]" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38200r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not process Internet Control Message Protocol [ICMP] timestamp requests."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.icmp.timestamp ; exit_status ;;
		2 ) echo "[FIX] If the value of net.inet.icmp.timestamp is not set to "1", this is a finding." ; echo "Edit the sysctl file and set the value of net.inet.icmp.timestamp to "1"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38201r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not respond to Internet Control Message Protocol [ICMPv4] echoes sent to a broadcast address."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.icmp.bmcastecho ; exit_status ;;
		2 ) echo "[FIX] If the value is not set to "1", this is a finding." ; echo "Edit the sysctl file and set the value of "net.inet.icmp.bmcastecho" to "1"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38202r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must prevent local applications from generating source-routed packets."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.ip.sourceroute ; exit_status ;;
		2 ) echo "[FIX] If the value of "net.inet.ip.sourceroute" is not set to "1", this is a finding." ; echo "Edit the sysctl file and set the value of net.inet.ip.sourceroute to 1." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38203r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not accept source-routed IPv4 packets."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.ip.accept_sourceroute ; exit_status ;;
		2 ) echo "[FIX] If the value of "net.inet.ip.accept_sourceroute" is not set to "0", this is a finding." ; echo "Edit the sysctl file and set the value of net.inet.ip.accept_sourceroute to 0." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38204r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must ignore IPv4 ICMP redirect messages."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.ip.drop_redirect ; exit_status ;;
		2 ) echo "[FIX] If the value of "net.inet.ip.drop_redirect" is not set to "0", this is a finding." ; echo "Edit the sysctl file and set the value of "net.inet.ip.drop_redirect" to "0"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38205r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not send IPv4 ICMP redirects."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.ip.redirect ; exit_status ;;
		2 ) echo "[FIX] If the value of "net.inet.ip.redirect" is not set to "0", this is a finding." ; echo "Edit the sysctl file and set the value of net.inet.ip.redirect to 0." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38057r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not have the finger service active."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) grep disable /etc/xinetd.d/finger ; exit_status ;;
		2 ) echo "[FIX] If the finger service is not disabled [Disabled = yes], this is a finding." ; echo "/etc/xinetd.d/finger and set "disable=yes"" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39360r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The SSH daemon must be configured to only use FIPS 140-2 approved ciphers."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) grep -i ciphers /etc/ssh/sshd_config | grep -v '^#'  ; exit_status ;;
		2 ) echo "[FIX] If no lines are returned, or the returned ciphers list contains any cipher not starting with "3des" or "aes", this is a finding." ; echo "Edit the SSH daemon configuration file /etc/ssh/sshd_config to remove any ciphers not starting with "3des" or "aes"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39364r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The SSH daemon must be configured to not use CBC ciphers."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat $sshd_config | tr '\011' ' ' | tr -s ' ' | sed -e 's/^[ \t]*//' | grep -v '^#' | \ egrep -I "ciphers" | grep -I cbc ; exit_status ;;
		2 ) echo "[FIX] If no lines are returned, or the returned ciphers list contains any cipher ending with cbc, this is a finding." ; echo "Edit the SSH daemon configuration file "ssh_config" and remove any ciphers ending with cbc. If necessary, add a Ciphers line." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39369r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The SSH daemon must be configured to only use Message Authentication Codes [MACs] that employ FIPS 140-2 approved cryptographic hash algorithms."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/sshd_config | grep MACs ; exit_status ;;
		2 ) echo "[FIX] If no lines are returned, or the returned MACs list contains any MAC other than "hmac-sha1", this is a finding."  ; echo "Edit the SSH daemon configuration "ssh_config" and remove any MACs other than "hmac-sha1"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39371r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The SSH client must be configured to only use FIPS 140-2 approved ciphers."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/ssh_config | grep Ciphers ; exit_status ;;
		2 ) echo "[FIX] If no lines are returned, or the returned ciphers list contains any cipher not starting with "3des" or "aes", this is a finding." ; echo "Edit the SSH client configuration file "/etc/ssh_config" and remove any ciphers not starting with "3des" or "aes"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39374r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The SSH client must be configured to not use CBC-based ciphers."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/ssh_config | grep cbc ; exit_status ;;
		2 ) echo "[FIX] If no lines are returned, or the returned ciphers list contains any cipher ending with "cbc", this is a finding." ; echo "Edit the SSH client configuration file "/etc/ssh_config" and remove any ciphers ending with "cbc"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39376r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The SSH client must be configured to only use Message Authentication Codes [MACs] that employ FIPS 140-2 approved cryptographic hash algorithms."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/ssh_config | grep hmac-sha1 ; exit_status ;;
		2 ) echo "[FIX] If no lines are returned, or the returned MACs list contains any MAC other than "hmac-sha1", this is a finding." ; echo "Edit the SSH client configuration file "/etc/ssh_config" and remove any MACs other than "hmac-sha1"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38186r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] IP forwarding for IPv4 must not be enabled, unless the system is a router."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sysctl -a | grep net.inet.ip.fw.enable ; exit_status ;;
		2 ) echo "[FIX] If the value of "net.inet.ip.fw.enable" is not set to "0", this is a finding." ; echo "Edit the sysctl file, and set the "net.inet.ip.fw.enable" parameter to "0"." ; echo "sysctl -w net.inet.ip.fw.enable=0" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38158r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The nosuid option must be enabled on all NFS client mounts."
echo "[NOTE] /etc/fstab does not exist in OS X. /etc/fstab.hd exists, but outputs not to depend on this file or its contents."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) mount -v | grep "type nfs" | egrep -v "nosuid" ; exit_status ;;
		2 ) echo "[FIX] If the mounted file systems do not have the "nosuid" option, this is a finding." ; echo "Edit /etc/fstab, and add the "nosuid" option for all NFS file systems. Remount the NFS file systems to make the change take effect." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39379r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If the system is using LDAP for authentication or account information, the system must check that the LDAP server's certificate has not been revoked."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) grep -v '^#' /etc/nsswitch.conf | grep ldap ; exit_status ; echo "If no lines are returned, this vulnerability is not applicable. To verify the NSS LDAP client is configured to check certificates against a certificate revocation list, enter the following command:" ; echo "rep -i '^tls_crlcheck' /etc/ldap.conf" ;;
		2 ) echo "[FIX] If the setting does not exist, or the value is not "all", this is a finding." ; echo "Edit the "/etc/ldap.conf" file and add or set the "tls_crlcheck" setting to "all"." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39384r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system's local firewall must implement a deny-all, allow-by-exception policy."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to find out how to execute the FIX."
echo "Enter 2 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "[FIX] Determine if the system's local firewall implements a deny-all, allow-by-exception policy. If it does not, this is a finding." ; echo "Configure the system's local firewall to implement a deny-all, allow-by-exception policy." ;;
		2 ) exit ;;
		
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37149r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Unnecessary packages must not be installed."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pkgutil / --pkgs ; exit_status ;;
		2 ) echo "[FIX] Review the packages installed, determine if the installed packages are needed. If not, then this is a finding." ; echo "Determine if the installed packages are needed. If not, verify any dependencies and use the rm command to remove them." ;;
		3 ) exit ;;
	esac
done
 
echo "---------------------------"
echo "[STIG ID] SV-37153r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Administrator accounts must be created with difficult-to-guess names."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to find out how to execute the FIX."
echo "Enter 2 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "1. Select Finder." ; echo "2. Select Applications." ; echo "3. Select System Preferences." ; echo "4. Select Accounts. " ; echo "[FIX] Verify there are no easy to guess administrator account names. If any accounts have easy to guess names, this is a finding." ; echo "Rename or recreate accounts with difficult-to-guess names." ;;
		2 ) exit ;;
		
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37190r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All application software must be current."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "[FIX] Review the result for proper versions and current patch level." ; echo "[NOTE] This check does not show third party software or updates." ; echo "[NOTE] Do not enable Automatic Updating as this will conflict with V-25298." ; exit_status ;;
		2 ) softwareupdate --list or softwareupdate --list --all  ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37208r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] POSIX access permissions must be assigned based on user categories." 
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) ls -ls /Users ; exit_status ;;
		2 ) echo "[FIX] If permissions are not set to 700, this is a finding." ; echo "chmod 700 /Users/* " ; echo "[NOTE] Changing permissions on a user's home directory from 750 to 700 will disable Apple file sharing. User's home directory POSIX permissions should be set to 700." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38521r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Security auditing must be configured."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/security/audit_control | grep flags: ; exit_status ;;
		2 ) echo "[FIX] Ensure the line includes the following: flags: lo,ad,-all,-fr,fd,fm,^-fa,^-fc,^-cl. If the file does not contain appropriate flags, this is a finding." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38522r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Local logging must be enabled." 
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to find out how to CHECK this STIG & execute the FIX."
echo "Enter 2 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) echo "pico /etc/newsyslog.conf" ; echo "[FIX] If the count values are not set to 14, this is a finding." ; echo "pico /etc/newsyslog.conf" ; echo "Set all 'count' values to 14" ;;
		2 ) exit ;;
		
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38525r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Prevent root login must be securely configured in /etc/sshd_config." 
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/sshd_config | grep PermitRootLogin ; exit_status ;;
		2 ) echo "[FIX] Ensure the value "PermitRootLogin" is set to "No". If the value "PermitRootLogin" is not set to "No", this is a finding. However, be advised this STIG will foil your Retina scans." ; echo "Edit the value "PermitRootLogin" and set it to "No"." ; echo "pico /etc/sshd_config" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38526r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Login Grace Time must be securely configured in /etc/sshd_config." 
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/sshd_config | grep LoginGraceTime ; exit_status ;;
		2 ) echo "[FIX] Ensure the value "LoginGraceTime" is set to 30 or less. If the value "LoginGraceTime" is not set to 30 or less, this is a finding." ; echo "Edit the value: LoginGraceTime to 30." ; echo "pico /etc/sshd_config" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37209r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] /etc/sshd_config - Protocol version must be securely configured."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/sshd_config | grep Protocol ; exit_status ;;
		2 ) echo "[FIX] Ensure the value Protocol is set to "2". If the value Protocol is not set to "2", this is a finding." ; echo "Edit the value: Protocol to "2"." ; echo "pico /etc/sshd_config" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38528r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The Software Update Server URL must be assigned to an organizational value." 
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) defaults read com.apple.SoftwareUpdate CatalogURL ; exit_status ;;
		2 ) echo "[FIX] The value returned is the current Software Update Server. Verify it is an approved SUS. If no value is returned, the system is using a default Apple Update Server and this is a finding." ; echo "defaults write com.apple.SoftwareUpdate CatalogURL 'new_SUS_URL'" ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37214r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The ability for administrative accounts to unlock Screen Saver must be disabled."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) cat /etc/authorization | grep -A 10 system.login.screensaver ; exit_status ;;
		2 ) echo "[FIX] Ensure the "system.login.screensaver" key includes the value "authenticate-session-owner". If not, this is a finding." ; echo "pico /etc/authorization" ; echo "^ W authenticate-session-owner-or-admin" ; echo "Change "authenticate-session-owner-or-admin " to "authenticate-session-owner" in the "system.login.screensaver" key." ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38569r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The Operating System must be current and at the latest release level. If an OS is at an unsupported release level, this will be upgraded to a Category I finding since new vulnerabilities may not be patched."
echo "[NOTE] Extraneous due to SV-37190r1_rule, no need to run this."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to run the CHECK."
echo "Enter 2 to find out how to execute the FIX."
echo "Enter 3 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) sudo softwareupdate --list --all ; exit_status ;;
		2 ) echo "[FIX] Review the results and verify the system is at the current release level. If not, this is a finding." ; echo "Install the current OS updates and patches." ;;
		3 ) exit ;;
	esac
done


echo "--------------------------------------------------------"
echo "The following semi-automated tasks have different"
echo "Executions depending on whether the system is 'managed'"
echo "or not. If you don't know what this means, then you should"
echo "probably select 'unmanaged' for each of these."
echo "--------------------------------------------------------"

echo "---------------------------"
echo "[STIG ID] SV-37158r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] A maximum password age must be set."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep maxMinutesUntilChangePassword ; exit_status ; echo "[FIX] If the value of "maxMinutesUntilChangePassword" is greater than 86400, this is a finding." ;;
		2 ) pwpolicy -n -setglobalpolicy "maxMinutesUntilChangePassword=86400" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep maxMinutesUntilChangePassword ; exit_status ; echo "[FIX] If the value of "maxMinutesUntilChangePassword" is greater than 86400, this is a finding." ;;
		4 ) pwpolicy -n /Local/Default -setglobalpolicy "maxMinutesUntilChangePassword=86400" ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37166r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] A minimum password age must be set."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep minMinutesUntilChangePassword ; exit_status ; echo "[FIX] If the value of "minMinutesUntilChangePassword" is less than 1440, this is a finding." ;;
		2 ) pwpolicy -n -setglobalpolicy "minMinutesUntilChangePassword=1440" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep minMinutesUntilChangePassword ; exit_status ; echo "[FIX] If the value of "minMinutesUntilChangePassword" is less than 1440, this is a finding." ;;
		4 ) pwpolicy -n /Local/Default -setglobalpolicy "minMinutesUntilChangePassword=1440" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37172r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] A minimum password length must be set."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep minChars ; exit_status ; echo "[FIX] If the value of minChars is less than 15, then this is a finding." ;;
		2 ) pwpolicy -n -setglobalpolicy "minChars=15" ; exit_status;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep minChars ; exit_status ; echo "[FIX] If the value of minChars is less than 15, then this is a finding." ;;
		4 ) pwpolicy -n /Local/Default -setglobalpolicy "minChars=15" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38603r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Complex passwords must contain Alphabetic Character."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep requiresAlpha ; exit_status ; echo "[FIX] If the value of requiresAlpha is not set to 1, this is a finding." ;;
		2 ) pwpolicy -n - setglobalpolicy "requiresAlpha=1" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep requiresAlpha ; exit_status ; echo "[FIX] If the value of requiresAlpha is not set to 1, this is a finding." ;;
		4 ) pwpolicy -n /Local/Default - setglobalpolicy "requiresAlpha=1" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38607r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Complex passwords must contain Symbolic Character."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep requiresSymbol ; exit_status ; echo "[FIX] If the value of requireSymbol is not set to 1, this is a finding." ;;
		2 ) pwpolicy -n - setglobalpolicy "requiresSymbol=1" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep requiresSymbol ; exit_status echo "[FIX] If the value of requireSymbol is not set to 1, this is a finding." ;;
		4 ) pwpolicy -n /Local/Default - setglobalpolicy "requiresSymbol=1" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37177r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Newly created password content must be checked."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep passwordCannotBeName ; exit_status ; echo "[FIX] If the value of "passwordCannotBeName" is not equal to "1", this is a finding." ;;
		2 ) pwpolicy -n -setglobalpolicy "passwordCannotBeName=1" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep passwordCannotBeName ; exit_status ; echo "[FIX] If the value of "passwordCannotBeName" is not equal to "1", this is a finding." ;;
		4 ) pwpolicy -n /Local/Default -setglobalpolicy "passwordCannotBeName=1" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37184r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Account lockout duration must be properly configured."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep minutesUntilFailedLoginReset ; echo "[FIX] If the value of "minutesUntilFailedLoginReset" is greater than "0", this is a finding." ; exit_status ;;
		2 ) pwpolicy -n -setglobalpolicy "minutesUntilFailedLoginReset=0" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep minutesUntilFailedLoginReset ; exit_status ; echo "[FIX] If the value of "minutesUntilFailedLoginReset" is greater than "0", this is a finding." ;;
		4 ) pwpolicy -n /Local/Default -setglobalpolicy "minutesUntilFailedLoginReset=0" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37186r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Account lockout threshold must be properly configured."
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo ""
echo "Enter 1 to run the CHECK for a MANAGED system."
echo "Enter 2 to execute the FIX for a MANAGED system."
echo ""
echo "Enter 3 to run the CHECK for an UNMANAGED system."
echo "Enter 4 to execute the FIX for an UNMANAGED system."
echo ""
echo "Enter 5 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) pwpolicy -n -getglobalpolicy | tr " " "\n" | grep maxFailedLoginAttempts ; exit_status ; echo "[FIX] If the value of "maxFailedLoginAttempts" is more than "3", this is a finding." ;;
		2 ) pwpolicy -n -setglobalpolicy "maxFailedLoginAttempts=3" ; exit_status ;;
		3 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep maxFailedLoginAttempts ; exit_status ; echo "[FIX] If the value of "maxFailedLoginAttempts" is more than "3", this is a finding." ;;
		4 ) pwpolicy -n /Local/Default -setglobalpolicy "maxFailedLoginAttempts=3" ; exit_status ;;
		5 ) exit ;;
	esac
done

echo "--------------------------------------------------------"
echo ""
echo "Done. I'm now taking you back to the menu."
echo "When you get there, select option 3 to continue!"
press_enter
echo "--------------------------------------------------------"
exec ./script.sh 2>&1 | tee script.$TODAYSDATE.log

# END PART 2
