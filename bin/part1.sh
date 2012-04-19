# PART 1 BEGIN

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

echo "--------------------------------------------------------"
echo "Let's work on the automated tasks first. Don't panic!"
echo "I will ask you to confirm all steps before proceeding."
echo ""
read -p "If you're ready, we'll begin. Hit 'Return' to continue."
echo "--------------------------------------------------------"

echo ""
echo ""

echo "Let's run diskutil to fix our global permissions before modifying any others."
echo "---------------------------"
echo "[STIG ID] SV-37845r1_rule"
echo "[CHECK] All system start-up files must be owned by root."
echo "---------------------------"
echo "[STIG ID] SV-38018r1_rule"
echo "[CHECK] All system start-up files must be group-owned by root, sys, bin, other, or system."
echo "---------------------------"
echo "[STIG ID] SV-38144r1_rule"
echo "[CHECK] System audit logs must be group-owned by root, bin, sys, or system."
echo "---------------------------"
echo "[STIG ID] SV-38138r1_rule"
echo "[CHECK] The system package management tool must be used to verify system software periodically."
echo "---------------------------"
echo "[STIG ID] SV-38139r1_rule"
echo "[CHECK] The file integrity tool must be configured to verify ACLs."
echo "---------------------------"
echo "[STIG ID] SV-38141r1_rule"
echo "[CHECK] The file integrity tool must be configured to verify extended attributes."
echo "---------------------------"
echo ""
echo "[FIX] If files are shown with incorrect permissions, this is a finding. Don't panic: Running diskutil may take a few minutes."
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
		1 ) diskutil verifyPermissions / ; exit_status ;;
		2 ) diskutil repairPermissions / ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-38632r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If the value of usingHistory is less than 15, this is a finding."
echo "[FIX] The system must prohibit the reuse of passwords to 15 iterations."
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
		1 ) pwpolicy -n /Local/Default -getglobalpolicy | tr " " "\n" | grep usingHistory ; exit_status ;;
		2 ) pwpolicy -n /Local/Default -setglobalpolicy "usingHistory=15" ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-37853r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System files and directories must not have uneven access permissions."
echo "[FIX] If any directories listed contain uneven file permissions, this is a finding."
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
		1 )  ls -lL /etc /bin /usr/bin /usr/lbin /usr/usb /sbin /usr/sbin ; exit_status ;;
		2 )  chmod -R 755 /etc /bin /usr/bin /usr/lbin /usr/usb /sbin /usr/sbin ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID]: SV-38070r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All network services daemon files must not have extended ACLs."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 )  ls -la /usr/sbin ; exit_status ;;
		2 )  chmod -N /usr/sbin/* ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38073r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System log files must not have extended ACLs, except as needed to support authorized software."
echo "[FIX] If the permissions include a '+', the file has an extended ACL. If an extended ACL exists, verify with the SA if the ACL is required to support authorized software and provides the minimum necessary permissions. If an extended ACL exists, providing access beyond the needs of authorized software, this is a finding."
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
		1 )  ls -lL /var/log ; exit_status ;;
		2 )  chmod -N /var/log/* ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37910r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Manual page files must have mode 0644 or less permissive."
echo "[FIX] If the permissions are not set to 0644 or less permissive, this is a finding."
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
		1 ) ls -lL /usr/share/man ; exit_status ;;
		2 ) chmod 0644 /usr/share/man ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38074r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All manual page files must not have extended ACLs."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 )  ls -lL /usr/share/man ; exit_status ;;
		2 )  chmod -N /usr/share/man/* ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38075r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All library files must not have extended ACLs."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /usr/lib/* ; exit_status ;;
		2 ) chmod -N /usr/lib/* ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38077r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/resolv.conf file must be owned by root."
echo "[FIX] If the resolv.conf file is not owned by root, this is a finding."
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
		1 )  ls -lL /etc/resolv.conf ; exit_status ;;
		2 )  chown root /etc/resolv.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38078r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/resolv.conf file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the resolv.conf file is not group owned by root, sys, or bin, this is a finding."
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
		1 ) ls -lL /etc/resolv.conf ; exit_status ;;
		2 ) chgrp wheel /etc/resolv.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38079r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/resolv.conf file must have mode 0644 or less permissive."
echo "[FIX] If the permissions are not set to 644, this is a finding."
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
		1 ) ls -Ll /etc/resolv.conf ; exit_status ;;
		2 ) chmod 644 /etc/resolv.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38081r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/resolv.conf file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/resolv.conf ; exit_status ;;
		2 ) chmod -N /etc/resolv.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38082r1_rul"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/hosts file must be owned by root."
echo "[FIX] If the /etc/hosts file is not owned by root, this is a finding."
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
		1 ) ls -lL /etc/hosts ; exit_status ;;
		2 ) chown root /etc/hosts ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38083r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/hosts file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the /etc/hosts file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -lL /etc/hosts ; exit_status ;;
		2 ) chgrp wheel /etc/hosts ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38085r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/hosts file must have mode 0644 or less permissive."
echo "[CHECK] The /etc/hosts file must have mode 0644 or less permissive."
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
		1 ) ls -lL /etc/hosts ; exit_status ;;
		2 ) chmod 644 /etc/hosts ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38086r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/hosts file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/hosts ; exit_status ;;
		2 ) chmod -N /etc/hosts ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38087r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/passwd file must be owned by root."
echo "[FIX] If the /etc/passwd file is not owned by root, this is a finding."
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
		1 ) ls -lL /etc/passwd ; exit_status ;;
		2 ) chown root /etc/passwd ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38088r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/passwd file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the /etc/passwd file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -lL /etc/passwd ; exit_status ;;
		2 ) chgrp wheel /etc/passwd ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37990r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/passwd file must have mode 0644 or less permissive."
echo "[FIX] If the permissions are not set to 644, this is a finding."
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
		1 ) ls -Ll /etc/passwd ; exit_status ;;
		2 ) chmod 644 /etc/passwd ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38089r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/passwd file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/passwd ; exit_status ;;
		2 ) chmod -N /etc/passwd ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38093r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/group file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/group ; exit_status ;;
		2 ) chmod -N /etc/group ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38090r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/group file must be owned by root."
echo "[FIX] If the /etc/group file is not owned by root, this is a finding."
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
		1 ) ls -lL /etc/group ; exit_status ;;
		2 ) chown root /etc/group ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38091r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/group file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the /etc/group file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -lL /etc/group ; exit_status ;;
		2 ) chgrp wheel /etc/group ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38092r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/group file must have mode 0644 or less permissive."
echo "[FIX] If the /etc/group file permissions are not set to 644, this is a finding."
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
		1 ) ls -lL /etc/group ; exit_status ;;
		2 ) chmod 644 /etc/group ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38058r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All global initialization files must have mode 0644 or less permissive."
echo "[FIX] If any global initialization files are more permissive than 0644, this is a finding."
echo "[NOTE] I will output five different exit statuses, as this is a chained series of five commands."
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
		1 ) ls -l /etc/bashrc ; exit_status ; ls -l /etc/csh.cshrc ; exit_status ; ls -l /etc/csh.login ; exit_status ; ls -l /etc/csh.logout ; exit_status ; ls -l /etc/profile ; exit_status ;;
		2 ) chmod 644 /etc/bashrc ; exit_status ; chmod 644 /etc/csh.cshrc ; exit_status ; chmod 644 /etc/csh.login ; exit_status ; chmod 644 /etc/csh.logout ; exit_status ; chmod 644 /etc/profile ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38060r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All global initialization files must be owned by root."
echo "[FIX] If any global initialization file is not owned by root, this is a finding."
echo "[NOTE] I will output five different exit statuses, as this is a chained series of five commands."
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
		1 ) ls -l /etc/bashrc ; exit_status ; ls -l /etc/csh.cshrc ; exit_status ; ls -l /etc/csh.login ; exit_status ; ls -l /etc/csh.logout ; exit_status ; ls -l /etc/profile ; exit_status ;;
		2 ) chown root /etc/bashrc ; exit_status ; chown root /etc/csh.cshrc ; exit_status ; chown root /etc/csh.login ; exit_status ; chown root /etc/csh.logout ; exit_status ; chown root /etc/profile ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38061r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All global initialization files must be group-owned by root, sys, bin, other, system, or the system default."
echo "[FIX] If any global initialization file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -l /etc/bashrc ; exit_status ; ls -l /etc/csh.cshrc ; exit_status ; ls -l /etc/csh.login ; exit_status ; ls -l /etc/csh.logout ; exit_status ; ls -l /etc/profile ; exit_status ;;
		2 ) chgrp wheel /etc/bashrc ; exit_status ; chgrp wheel /etc/csh.cshrc ; exit_status ; chgrp wheel /etc/csh.login ; exit_status ; chgrp wheel /etc/csh.logout ; exit_status ; chgrp wheel /etc/profile ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38002r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] There must be no .netrc files on the system."
echo "[FIX] If any .netrc file exists, this is a finding."
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
		1 ) find / -name .netrc ; exit_status ;;
		2 ) find / -name .netrc -exec rm {} \; ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38619r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System audit logs must be owned by root."
echo "[FIX] If the /etc/audit file is not owned by root, this is a finding."
echo "[NOTE] Typically excluded due to no audit system default on OS X"
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
		1 ) ls -lL /etc/audit ; exit_status ;;
		2 ) chown root /etc/audit file ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38105r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The cron.allow file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding."
echo "[NOTE] Optional - this may or may not exist in OS X as opposed to cron.deny."
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
		1 ) ls -l /etc/cron.allow ; exit_status ;;
		2 ) chmod -N /etc/cron.allow ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38105r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The cron.allow file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding."
echo "[NOTE] Optional - this may or may not exist in OS X as opposed to cron.deny."
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
		1 ) ls -l /etc/cron.allow ; exit_status ;;
		2 ) chmod -N /etc/cron.allow ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38115r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The cron.deny file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL. If the file has an extended ACL and it has not been documented with the IAO, this is a finding."
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
		1 ) ls -l /private/var/at/cron.deny ; exit_status ;;
		2 ) chmod -N /private/var/at/cron.deny ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38117r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The cron.allow file must be group-owned by root, bin, sys, or cron."
echo "[FIX] If the "/private/var/at/cron.allow" file is not group owned by root, bin, sys or system, this is a finding."
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
		1 ) ls -lL /private/var/at/cron.allow ; exit_status ;;
		2 ) chgrp wheel /private/var/at/cron.allow ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38119r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The cron.deny file must be group-owned by root, bin, sys, or cron."
echo "[FIX] If the "/private/var/at/cron.deny" file is not group owned by root, bin, sys or system, this is a finding."
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
		1 ) ls -lL /private/var/at/cron.deny ; exit_status ;;
		2 ) chgrp wheel /private/var/at/cron.deny ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38019r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The "at" directory must have mode 0755 or less permissive."
echo "[FIX] If the directory mode is more permissive than 0755, this is a finding."
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
		1 ) ls -ld /var/at ; exit_status ;;
		2 ) chmod 755 /var/at ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38021r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The "at" directory must be owned by root, bin, or sys."
echo "[FIX] If the directory is not owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -ld /var/at ; exit_status ;;
		2 ) chown root /var/at ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38023r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The at.allow file must be owned by root, bin, or sys."
echo "[FIX] If the at.allow file is not owned by root, sys, or bin, this is a finding."
echo "[NOTE] Optional - this may or may not exist in OS X as opposed to at.deny"
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
		1 ) ls -lL /var/at/at.allow ; exit_status ;;
		2 ) chown root /var/at/at.allow ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38024r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The at.deny file must be owned by root, bin, or sys."
echo "[FIX] If the at.deny file is not owned by root, sys, or bin, this is a finding."
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
		1 ) ls -lL /var/at/at.deny ; exit_status ;;
		2 ) chown root /var/at/at.deny ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38198r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Kernel core dumps must be disabled unless needed."
echo "[FIX] If "diskdump enabled" is returned, this is a finding."
echo "[NOTE] Coredumps disabled by default in 10.6, no check or fix available at this time"
echo ""
echo "Enter 0 to skip this STIG and continue to the next."
echo "Enter 1 to exit this script."
selection=
until [ "$selection" = "0" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37996r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The services file must be owned by root or bin."
echo "[FIX] If the services file is not owned by root or bin, this is a finding."
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
		1 ) ls -lL /etc/services ; exit_status ;;
		2 ) chown root /etc/services ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38122r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The services file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the /etc/services file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -lL /etc/services ; exit_status ;;
		2 ) chgrp wheel /etc/services ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37997r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The services file must have mode 0644 or less permissive."
echo "[FIX] If the services file has a mode more permissive than 0644, this is a finding."
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
		1 ) ls -lL /etc/services ; exit_status ;;
		2 ) chmod 0644 /etc/services ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38124r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The services file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/services ; exit_status ;;
		2 ) chmod -N /etc/services ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38052r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The rsh daemon must not be running."
echo "[FIX] If the command does not return a value of 1, this is a finding."
echo "[NOTE] Typically excluded due to no rsh daemon included default on OS X"
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
		1 ) defaults read /System/Library/LaunchDaemons/rshd Disabled ; exit_status ;;
		2 ) defaults write /System/Library/LaunchDaemons/com.apple.uucp Disabled 1; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38054r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The rexec daemon must not be running."
echo "[FIX] If the command does not return a value of 1, this is a finding."
echo "[NOTE] Typically excluded due to no exec daemon included default on OS X"
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
		1 ) defaults read /System/Library/LaunchDaemons/rexec Disabled ; exit_status ;;
		2 ) defaults write/System/Library/LaunchDaemons/rexec Disabled ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38213r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The telnet daemon must not be running."
echo "[FIX] If a 1 is not returned, this is a finding."
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
		1 ) defaults read /System/Library/LaunchDaemons/telnet Disabled ; exit_status ;;
		2 ) defaults write /System/Library/LaunchDaemons/telnet Disabled ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38026r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The traceroute command owner must be root."
echo "[FIX] If the traceroute command is not owned by root, this is a finding."
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
		1 ) ls -lL /usr/sbin/traceroute ; exit_status ;;
		2 ) chown root /usr/sbin/traceroute ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38027r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The traceroute command must be group-owned by sys, bin, root, or system."
echo "[FIX] If the traceroute command is not group owned by root, sys, or bin, this is a finding."
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
		1 ) ls -lL /usr/bin/traceroute ; exit_status ;;
		2 ) chgrp wheel /usr/bin/traceroute ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38028r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The traceroute file must have mode 0700 or less permissive."
echo "[FIX] If the traceroute command has a mode more permissive than 0700, this is a finding."
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
		1 ) ls -lL /usr/sbin/traceroute ; exit_status ;;
		2 ) chmod 700 /usr/bin/traceroute ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38127r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The traceroute file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /usr/sbin/traceroute ; exit_status ;;
		2 ) chmod -N /usr/sbin/traceroute ß; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38128r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The aliases file must be group-owned by root, sys, bin, or system."
echo "[FIX] If the /etc/aliases file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -lL /etc/aliases ; exit_status ;;
		2 ) chgrp wheel /etc/aliases ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38131r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The alias file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/aliases ; exit_status ;;
		2 ) chmod -N /etc/aliases ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38005r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not use .forward files."
echo "[FIX] If any .forward files are found on the system, this is a finding."
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
		1 ) find / -name .forward -print ; exit_status ;;
		2 ) find / -name .forward -exec rm {} \; ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38055r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not have the UUCP service active."
echo "[FIX] If UUCP is found enabled [value of 1], this is a finding."
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
		1 ) defaults read /System/Library/LaunchDaemons/com.apple.uucp Disabled ; exit_status ;;
		2 ) defaults read /System/Library/LaunchDaemons/com.apple.uucp Disabled ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38133r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/syslog.conf file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/syslog.conf ; exit_status ;;
		2 ) chmod -N /etc/syslog.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38030r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/syslog.conf file must be owned by root."
echo "[FIX] If the syslog.conf file is not owned by root, this is a finding."
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
		1 ) ls -lL /etc/syslog.conf ; exit_status ;;
		2 ) chown root /etc/syslog.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38051r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/syslog.conf file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the syslog.conf file is not group owned by root, sys, or bin, this is a finding."
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
		1 ) ls -lL /etc/syslog.conf ; exit_status ;;
		2 ) chgrp wheel /etc/syslog.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38183r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/smb.conf file must be owned by root."
echo "[FIX] If an smb.conf file is not owned by root, this is a finding."
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
		1 ) ls -lL /etc/smb.conf ; exit_status ;;
		2 ) chown root /etc/smb.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38184r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/smb.conf file must have mode 0644 or less permissive."
echo "[FIX] If the value is not set to 0644, this is a finding."
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
		1 ) ls -lL /etc/smb.conf ; exit_status ;;
		2 ) chmod 644 /etc/smb.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38135r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The /etc/smb.conf file must not have an extended ACL."
echo "[FIX] If the permissions include a '+', the file has an extended ACL, this is a finding."
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
		1 ) ls -lL /etc/smb.conf ; exit_status ;;
		2 ) chmod -N /etc/smb.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-39378r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The AppleTalk protocol must be disabled or not installed."
echo "[FIX] If no result is returned, this is a finding."
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
		1 ) grep 'install appletalk /bin/true' /etc/modprobe.conf /etc/modprobe.d/* ; exit_status ;;
		2 ) echo "install appletalk /bin/true" >> /etc/modprobe.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38142r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If the system is using LDAP for authentication or account information the /etc/ldap.conf [or equivalent] file must have mode 0644 or less permissive."
echo "[FIX] If the permissions are not set to 644, this is a finding."
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
		1 ) ls -Ll /etc/ldap.conf ; exit_status ;;
		2 ) chmod 644 /etc/ldap.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38155r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If the system is using LDAP for authentication or account information, the /etc/ldap.conf [or equivalent] file must be owned by root."
echo "[FIX] If the owner is not set to root, this is a finding."
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
		1 ) ls -Ll /etc/ldap.conf ; exit_status ;;
		2 ) chown root /etc/ldap.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38156r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If the system is using LDAP for authentication or account information, the /etc/ldap.conf [or equivalent] file must be group-owned by root, bin, sys, or system."
echo "[FIX] If the file is not group-owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -Ll /etc/ldap.conf ; exit_status ;;
		2 ) chgrp wheel /etc/ldap.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38157r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] If the system is using LDAP for authentication or account information, the /etc/ldap.conf [or equivalent] file must not have an extended ACL."
echo "[FIX] If the /etc/audit file is not group owned by root, bin, sys, or system, this is a finding."
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
		1 ) ls -lL /etc/audit ; exit_status ;;
		2 ) chgrp wheel /etc/audit ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37206r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Infrared [IR] support must be removed."
echo "[FIX] Ensure the following file does NOT exist: AppleIRController.kext. If the file exists, this is a finding." 
echo "[NOTE] As a chained fix of two commands, I will output two exit statuses for the fix."
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
		1 ) ls -al /System/Library/Extensions | grep AppleIRController.kext ; exit_status ;;
		2 ) rm -rf /System/Library/Extensions/AppleIRController.kext ; exit_status ; touch /System/Library/Extensions ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37193r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Wi-Fi support software must be disabled."
echo "[FIX] Ensure the following files do NOT exist: AppleAirPort.kext, AppleAirPort2.kext, and AppleAirPortFW.kext. If any of the files exist, this is a finding." 
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
		1 ) ls -al /System/Library/Extensions | grep AppleAirPort.kext ; exit_status ; ls -al /System/Library/Extensions | grep AppleAirPort2.kext ; exit_status ; ls -al /System/Library/Extensions | grep AppleAirPortFW.kext ; exit_status ;;
		2 ) rm -rf /System/Library/Extensions/AppleAirPort.kext ; exit_status ; rm -rf /System/Library/Extensions/AppleAirPort2.kext ; exit_status ; rm -rf /System/Library/Extensions/AppleAirPortFW.kext ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37198r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Bluetooth support software must be disabled."
echo "[FIX] Ensure the following files do NOT exist: IOBluetoothFamily.kext and IOBluetoothHIDDriver.kext. If the files exist, this is a finding."
echo "[NOTE] As a chained check and fix, I will output three exit statuses."
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
		1 ) ls -al /System/Library/Extensions | grep IOBluetoothFamily.kext ; exit_status ; ls -al /System/Library/Extensions | grep IOBluetoothHIDDriver.kext ; exit_status ;;
		2 ) rm -rf /System/Library/Extensions/IOBluetoothFamily.kext ; exit_status ; rm -rf /System/Library/Extensions/IOBluetoothHIDDriver.kext ; exit_status ; touch /System/Library/Extensions; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38556r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Access warning for the command line must be present." 
echo "[FIX] If the following DoD warning banner is not displayed at the top of the login panel before entering the user name and password, then this is a finding."
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
		1 ) echo "Is the login banner displayed when you logoff and log back in? No automated check available here.";;
		2 ) defaults write com.apple.loginwindow LoginwindowText "You are accessing a U.S. Government Information System that is provided for USG-authorized use only. By using this IS, which includes any device attached to this IS, you consent to the following conditions: The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct, law enforcement, and counterintelligence investigations. At any time, the USG may inspect and seize data stored on this IS. Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose. This IS includes security measures, e.g., authentication and access controls, to protect USG interests-not for your personal benefit or privacy. Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details." ; exit_status ;;
		3 ) exit ;;
	esac
done

# echo "---------------------------"
# echo "[STIG ID] SV-38513r1_rule"
# echo "---------------------------"
# echo ""
# echo "[CHECK] Access warning for the command line must be present."
# echo "[FIX] Open a shell session. The warning banner should be displayed in the terminal. If the following DoD warning banner is not displayed, then this is a finding."
# echo "[NOTE] This is an incorrect STIG. Already handled by SV-38556r1_rule."
# echo ""
# echo "Enter 0 to skip this STIG and continue to the next."
# echo "Enter 1 to run the CHECK."
# echo "Enter 2 to run the FIX."
# echo "Enter 3 to exit this script."
# selection=
# until [ "$selection" = "0" ]; do
# echo ""
# echo -n "Enter your selection:  "
# echo ""
# read selection
# case $selection in
# 		1 ) echo "[NOTE] Open a new terminal session and verify the banner is displayed. If not, run the fix." ;;
#		2 ) echo "You are accessing a U.S. Government Information System that is provided for USG-authorized use only. By using this IS, which includes any device attached to this IS, you consent to the following conditions: The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct, law enforcement, and counterintelligence investigations. At any time, the USG may inspect and seize data stored on this IS. Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose. This IS includes security measures, e.g., authentication and access controls, to protect USG interests-not for your personal benefit or privacy. Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details." > /etc/motd ; exit_status;;
#		3 ) exit ;;
#	esac
# done

echo "---------------------------"
echo "[STIG ID] SV-38614r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] usage must be restricted to a single terminal, and for only one instance at a time."
echo "[FIX] Ensure the following items exist: 'Defaults tty_tickets' and 'Defaults timestamp_timeout=0'."
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
		1 ) cat /etc/sudoers | grep "Defaults tty_tickets" ; exit_status ; cat /etc/sudoers | grep "Defaults timestamp_timeout=0" ; exit_status ;;
		2 ) echo "Defaults tty_tickets" >> /etc/sudoers ; exit_status ; echo "Defaults timestamp_timeout=0" >> /etc/sudoers ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-37212r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The default global umask setting must be changed." 
echo "[FIX] If the permission is not set to 027, this is a finding."
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
		1 ) launchctl umask ; exit_status ;;
		2 ) echo "umask 027" >> /etc/launchd.conf ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38527r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The MobileMe preference pane must be removed from System Preferences." 
echo "[FIX] If any of the files exist, this is a finding."
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
		1 ) ls -al /System/Library/PreferencePanes | grep MobileMe.prefPane ; exit_status ; ls -al /System/Library/PreferencePanes | grep Internet.prefPane ; exit_status ;;
		2 ) rm -R /System/Library/PreferencePanes/MobileMe.prefPane ; exit_status ; rm -R /System/Library/PreferencePanes/Internet.prefPane ; exit_status ; touch /System/Library/PreferencePanes ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38221r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit must be removed from the System Preferences.app file." 
echo "[FIX] Ensure the file permissions are set to -rwxrwxr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls "/Applications/System Preferences.app/Contents/Resources/installAssistant" ; exit_status ;;
		2 ) chmod 775 "/Applications/System Preferences.app/Contents/Resources/installAssistant" ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38222r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit must be removed from the ODBC Admin tool."
echo "[FIX] Ensure the file permissions are set to -rwxr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
echo "[NOTE] Not installed by default on OS X"
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
		1 ) ls -ls /Applications/Utilities/ODBC Administrator.app/Contents/Resources/iodbcadmintool ; exit_status ;;
		2 ) chmod 755 /Applications/Utilities/ODBC Administrator.app/Contents/Resources/iodbcadmintool ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38223r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Setuid bit must be removed from Apple Remote Desktop"
echo "[FIX] Ensure the file permissions are set to -rwxr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent ; exit_status ;;
		2 ) chmod 755 /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38224r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Setuid bit must be removed from WebDAV Web Services."
echo "[FIX] Ensure the file permissions are set to -rwxr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /System/Library/Extensions/webdav_fs.kext/Contents/Resources/load_webdav ; exit_status ;;
		2 ) chmod 755 /System/Library/Extensions/webdav_fs.kext/Contents/Resources/load_webdav ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38225r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit must be removed from Apple File Protocol."
echo "[FIX] Ensure the file permissions are set to -rwxr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /System/Library/Filesystems/AppleShare/afpLoad ; exit_status ;;
		2 ) chmod 755 /System/Library/Filesystems/AppleShare/afpLoad ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38227r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit must be removed from Apple File Protocol Sharing." 
echo "[FIX] If the permissions are not set to 711, this is a finding."
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
		1 ) ls -Ll /System/Library/Filesystems/AppleShare/afpLoad ; exit_status ;;
		2 ) chmod 711 /System/Library/Filesystems/AppleShare/check_afp.app/Contents/MacOS/check_afp ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38228r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Remove Setuid bit must be removed from dumpemacs."
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/libexec/dumpemacs ; exit_status ;;
		2 ) chmod 555 /usr/libexec/dumpemacs ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38229r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Setuid bit must be removed from XGrid."
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/libexec/xgrid/IdleTool ; exit_status ;;
		2 ) chmod 555 /usr/libexec/xgrid/IdleTool ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38230r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Setuid bit from Hosting VPN Services must be removed." 
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/sbin/vpnd ; exit_status ;;
		2 ) chmod 555 /usr/sbin/vpnd ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38232r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Setuid bit must be removed from Network Configuration."
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /sbin/route ; exit_status ;;
		2 ) chmod 555 /sbin/route ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38233r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit must be removed from the IPC Statistics." 
echo "[FIX] Ensure the file permissions are set to -r-x--x--x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/bin/ipcs ; exit_status ;;
		2 ) chmod 511 /usr/bin/ipcs ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38235r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit from Remote Access [unsecure] must be removed." 
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /bin/rcp ; exit_status ;;
		2 ) chmod 555 /bin/rcp ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38237r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit from rlogin must be removed." 
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/bin/rlogin ; exit_status ;;
		2 ) chmod 555 /usr/bin/rlogin ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38238r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit from Remote Access [unsecure] must be removed." 
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/bin/rsh ; exit_status ;;
		2 ) chmod 555 /usr/bin/rsh ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38239r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The setuid bit from System Activity Reporting must be removed." 
echo "[FIX] Ensure the file permissions are set to -r-xr-xr-x. If the permission is not the same or more restrictive, then this is a finding."
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
		1 ) ls -ls /usr/lib/sa/sadc ; exit_status ;;
		2 ) chmod 555 /usr/lib/sa/sadc ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38531r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The Auto Update feature must be disabled."
echo "[FIX] Verify "Automatic check" is off. If the option is not off, this is a finding."
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
		1 ) softwareupdate --schedule ; exit_status ;;
		2 ) softwareupdate --schedule off ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "---------------------------"
echo "[STIG ID] SV-38570r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Permission for system logs must be set."
echo "[FIX] If not set to 555 or more restricted, this is a finding.
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
		1 ) ls -lL /etc/security/audit_warn ; exit_status ;;
		2 ) chmod 555 /etc/security/audit_warn ; exit_status ;;
		3 ) exit ;;
	esac
done

echo "--------------------------------------------------------"
echo ""
echo "Done. I'm now taking you back to the menu."
echo "When you get there, select option 2 to continue!"
press_enter
echo "--------------------------------------------------------"
exec ./script.sh 2>&1 | tee script.$TODAYSDATE.log

# END PART 1