# PART 3 BEGIN

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
echo "Let's work on the GUI-driven manual tasks next."
echo "You'll need to do even more work for these… Sorry!"
echo "Protip: Keep menus open, as many of these STIGs rely"
echo "on modifying settings that coexist in similar places."
echo ""
read -p "If you're ready to continue, hit 'Return'."
echo "--------------------------------------------------------"
echo ""


echo "---------------------------"
echo "[STIG ID] SV-38509r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Audio recording support software must be disabled."
echo " 1. Open System Preferences  --  Sound. "
echo " 2. Select internal microphone and ensure "Input Volume" is set to "0"."
echo " 3. Select Line-In [if present] and ensure "Input Volume" is set to "0"." 
echo "[FIX] Select Display Audio and ensure "USB" is set to "0". If any of the parameters are not set to "0", this is a finding."
echo "rm -rf /System/Library/Extensions/AppleOnboardAudio.kext"
echo "rm -rf /System/Library/Extensions/AppleUSBAudio.kext"
echo "rm -rf /System/Library/Extensions/AppleDeviceTreeUpdater.kext"
echo "rm -rf /System/Library/Extensions/IOAudioFamily.kext"
echo "rm -rf /System/Library/Extensions/VirtualAudioDriver.kext"
echo "touch /System/Library/Extensions"
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37201r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Video recording support software must be disabled."
echo " 1. Open the /System/Library/Extensions folder. "
echo "[FIX] Ensure the following file does NOT exist: Apple_iSight.kext"
echo " 1. Control click the IOUSBFamily.kext and select Show Package Contents."
echo " 2. Open the /Contents/PlugIns/ folder." 
echo "[FIX] Ensure the following file does NOT exist: AppleUSBVideoSupport.kext"
echo "rm -rf /System/Library/Extensions/Apple_iSight.kext"
echo "rm -rf /System/Library/Extensions/IOUSBFamily.kext/Contents/Plugins/AppleUSBVideoSupport.kext"
echo "touch /System/Library/Extensions"
echo ""
echo "[NOTE] The touch command changes the modified date of the /System/Library/Extensions folder. When the folder has a new modified date, the Extension cache files [located in /System/Library/] are deleted and rebuilt by Mac OS X."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38510r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Open Firmware or EFI password must be present."
echo " 1. Log in with an administrator account and open the Firmware Password Utility [located on the Mac OS X installation disc in /Applications/Utilities/]."
echo "[FIX] Verify the "Require password to change Open Firmware settings" is selected."
echo " 1. Log in with an administrator account and open the Firmware Password Utility [located on the Mac OS X installation disc in /Applications/Utilities/]."
echo " 2. Click Change." 
echo " 3. Select "Require password to change Open Firmware settings"."
echo " 4. In the Password and Verify fields, enter a new Open Firmware or EFI password, and click OK. This password can be up to eight characters. Do not use the capital letter "U" in an Open Firmware password. If you do, your password will not be recognized during the startup process."
echo " 5. Close the Firmware Password Utility."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38514r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] LDAPv3 access must be securely configure [if it is used]."
echo " 1. Open Finder"
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo "[FIX] Click the Connection tab and verify "Encrypt using SSL" is selected. If "Encrypt using SSL" is not selected, this is a finding."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo " 14. Click the Connection tab and select "Encrypt using SSL"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38516r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] LDAP Authentication must use authentication when connecting to LDAPv3." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo "[FIX] Click the Security tab and verify the "Use authentication when connecting" is checked. If option is not checked, this is a finding."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo " 14. Click on Security tab and select "Use authentication when connecting"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38573r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Clear text passwords for all LDAPv3 directories must be disabled."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo "[FIX] Click on Security tab and verify the "Disable clear text passwords" is checked. If the value is not checked, this is a finding." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo " 14. Click the Security tab and select "Disable clear text passwords"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38575r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All LDAPv3 packets must be digitally signed." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo "[FIX] Click on Security tab and verify the "Digitally sign all packets [requires Kerberos] " is checked. If the value is not checked, this is a finding." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo " 14. Click on Security tab and select "Digitally sign all packets [requires Kerberos]". "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38577r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] All LDAPv3 packets must be encrypted." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo "[FIX] Click on Security tab and verify the "Encrypt all packets [requires SSL or Kerberos] " is checked. If the value is not checked, this is a finding."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo " 14. Click on Security tab and select "Encrypt all packets [requires SSL or Kerberos]"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38578r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] LDAPv3 must block man-in-the-middle attacks." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo "[FIX] Click on Security tab and verify the "Block man-in-the-middle attacks [requires Kerberos]" is checked. If the value is not checked, this is a finding."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Show Advanced Options button."
echo " 8. Click Services tab."
echo " 9. Click the Lock and enter the password to unlock the options [if needed]."
echo " 10. Click the LDAPv3 service."
echo " 11. Click the Pencil icon."
echo " 12. Highlight the Server Name/Configuration Name."
echo " 13. Click Edit."
echo " 14. Click the Security tab and select "Block man-in-the-middle attacks [requires Kerberos]". "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38518r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Active Directory Access must be securely configured." 
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Services tab. "
echo " 8. Double-click on Active Directory." 
echo " 9. Click on Show Advanced Options. "
echo "[FIX] Click on Administrative tab and ensure "Allow administration by" is not selected. If "Allow administration by" is selected, this is a finding."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Services tab. "
echo " 8. Double-click on Active Directory." 
echo " 9. Click on Show Advanced Options. "
echo " 10. Click on Administrative tab and deselect "Allow administration by" option."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38529r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The correct date and time must be set."
echo " 1. Open System Preferences - --  Date and Time Panel."
echo "[CHECK] The correct date and time must be set." 
echo "[FIX] Ensure the correct date and time is set. If the date and time are not correct, this is a finding." 
echo " 1. Open System Preferences - --  Date and Time Panel."
echo " 2. Set the correct date and time."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38530r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] A secure time server must be referenced." 
echo " 1. Open System Preferences -- Date and Time Panel. "
echo " 2. Ensure "Set date and time automatically" is selected. "
echo "[FIX] In the box for the time server, ensure the URL is entered along with either the address of a valid federal government NTP server or address of a local domain controller."
echo " 1. Open System Preferences] Date and Time Panel. "
echo " 2. Select "Set date and time automatically". "
echo " 3. In the box for the time server, type either the URL or IP address of a valid federal government NTP server or local domain controller. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37218r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The guest account must be disabled."
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Click on Guest Account. "
echo "[FIX] Ensure "Allow guests to login to this computer" option is unchecked. If the option is checked, this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Click on Guest Account. "
echo " 3. Deselect "Allow guests to login to this computer"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37219r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Shared folders must be disabled."
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Click on Guest Account. "
echo "[FIX] Ensure "Allow Guests to connect to shared folders" option is unchecked. If the option is checked, this is a finding."
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Click on Guest Account. "
echo " 3. Deselect "Allow Guests to connect to shared folders"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37221r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Login Window must be properly configured."
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo "[FIX] Ensure "Display login window as:" is set to "Name and password". If the option is not set to "Name and Password", this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo " 3. Set "Display login window as:" to 'Name and password'."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37225r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Input menu must not be shown in login window." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo "[FIX] Ensure the "Show input menu in login window" is not checked. If the option is checked, this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo " 3. Deselect "Show input menu in login window" to disable this option."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37223r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Restart, Sleep, and Shutdown buttons must not be shown prior to login." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo "[FIX] Ensure the "Show the Restart, Sleep, and Shutdown buttons" option is not checked. If the option is checked, this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo " 3. Deselect the "Show the Restart, Sleep, and Shutdown buttons" to disable this option."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37225r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Input menu must not be shown in login window." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo "[FIX] Ensure the "Show input menu in login window" is not checked. If the option is checked, this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo " 3. Deselect "Show input menu in login window" to disable this option."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37226r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must be configured to not show password hints."
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo "[FIX] Ensure the "Show password hints" is not checked. If the option is checked, this is a finding."
echo " 1. Open System Preferences -- Accounts Panel. "
echo " 2. Select Login Options. "
echo " 3. Deselect "Show password hints" to disable this option."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37229r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Fast User Switching must be disabled." 
echo " 1. Open System Preferences -- Accounts Panel."
echo " 2. Select Login Options. "
echo "[FIX] Ensure the "Enable Fast User Switching" is not checked. If the option is checked, this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel."
echo " 2. Select Login Options. "
echo " 3. Deselect "Enable Fast User Switching" to disable this option."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38532r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The password-related hint field must not be used." 
echo " 1. Open System Preferences -- Accounts Panel, for each account. "
echo " 2. Click 'reset password' [Change Password for current user]. "
echo "[FIX] If any accounts have hints data, this is a finding." 
echo " 1. Open System Preferences -- Accounts Panel, for each account. "
echo " 2. Click 'reset password' [Change Password for current user]. "
echo " 3. Remove any data in the password hints field. "
echo " The password Hints Field may include contact information for the organization's technical support."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37230r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic actions must be disabled for blank CDs."
echo " 1. Open System Preferences -- CDs and DVDs. "
echo "[FIX] Ensure "When you insert a blank CD:" is set to "Ignore". If the option is not set to "Ignore", this is a finding." 
echo " 1. Open System Preferences -- CDs and DVDs. "
echo " 2. Set "When you insert a blank CD:" to "Ignore"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37333r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic actions must be disabled for blank DVDs."
echo " 1. Open System Preferences -- CDs and DVDs. "
echo "[FIX] Ensure "When you insert a blank DVD:" is set to "Ignore". If the option is not set to "Ignore", this is a finding." 
echo " 1. Open System Preferences -- CDs and DVDs. "
echo " 2. Set "When you insert a blank DVD:" to "Ignore"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37231r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic actions must be disabled for music CDs." 
echo " 1. Open System Preferences -- CDs and DVDs. "
echo "[FIX] Ensure "When you insert a music CD:" is set to "Ignore". If the option is not set to "Ignore", this is a finding." 
echo " 1. Open System Preferences -- CDs and DVDs. "
echo " 2. Set "When you insert a music CD:" to "Ignore"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37235r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic actions must be disabled for picture CDs."
echo " 1. Open System Preferences -- CDs and DVDs. "
echo "[FIX] Ensure "When you insert a picture CD:" is set to "Ignore". If the option is not set to "Ignore", this is a finding."
echo " 1. Open System Preferences -- CDs and DVDs. "
echo " 2. Set "When you insert a picture CD:" to "Ignore"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37236r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic actions must be disabled for video DVDs."
echo " 1. Open System Preferences -- CDs and DVDs. "
echo "[FIX] Ensure "When you insert a video DVD:" is set to "Ignore". If the option is not set to "Ignore", this is a finding." 
echo " 1. Open System Preferences -- CDs and DVDs. "
echo " 2. Set "When you insert a video DVD:" to "Ignore"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38533r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System must have a password-protected screen saver configured to DoD requirements." 
echo " 1. Open System Preferences -- Desktop and Screen Saver. "
echo "[FIX] Select the screen saver tab. Ensure the "Start screen saver" slider is set to 15 minutes or less. If not, this is a finding." 
echo " 1. Open System Preferences -- Desktop and Screen Saver. "
echo " 2. Select the screen saver tab. "
echo " 3. Set the "Start screen saver" slider to 15 minutes or less. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38534r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not be allowed to restart after a power failure." 
echo " 1. Open System Preferences -- Energy Saver -- Options Pane. "
echo "[FIX] Ensure "Restart automatically after a power failure" is not checked. If the option is checked, this is a finding."
echo " 1. Open System Preferences -- Energy Saver -- Options Pane. "
echo " 2. Deselect "Restart automatically after a power failure" to disable this option. "
echo " For some Mac Books systems the "Restart automatically after a power failure" option is located on the "Power Adapter" pane. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37242r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The ability to use corners to disable the screen saver must be disabled."
echo " 1. Open System Preferences -- Expose and Spaces, Expose pane. "
echo "[FIX] Ensure no corners are set to "Disable Screen saver" in the "Active Screen Corners" section for each user account. If any account is set to disable screen savers via corners, this is a finding." 
echo " 1. Open System Preferences -- Expose and Spaces, Expose pane. "
echo " 2. Remove any corners which are set to "Disable Screen saver" in the "Active Screen Corners" section for each user account."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38535r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Bluetooth devices must not be allowed to wake the computer. If Bluetooth is not required, turn it off. If Bluetooth is necessary, disable allowing Bluetooth devices to awake the computer."
echo " 1. Open System Preferences  --  Open Keyboard and Mouse preferences. "
echo " 2. Click Bluetooth tab. "
echo "[FIX] Ensure "Allow Bluetooth devices to wake this computer" is not checked. If the option is checked, this is a finding." 
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38535r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Bluetooth devices must not be allowed to wake the computer. If Bluetooth is not required, turn it off. If Bluetooth is necessary, disable allowing Bluetooth devices to awake the computer."
echo " 1. Open System Preferences  --  Open Keyboard and Mouse preferences."
echo " 2. Click Bluetooth tab."
echo "[FIX] Ensure "Allow Bluetooth devices to wake this computer" is not checked. If the option is checked, this is a finding."
echo " 1. Open System Preferences  --  Keyboard and Mouse preferences."
echo " 2. Click Bluetooth tab."
echo " 3. Deselect "Allow Bluetooth devices to wake this computer"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37245r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Unused hardware devices must be disabled for Airport."
echo " 1. Open System Preferences -- Network."
echo " 2. From the list of hardware devices, select AirPort."
echo "[FIX] Ensure the "Status" is set to "Inactive". If the service is not inactive or removed, this is a finding."
echo " 1. Open System Preferences -- Network."
echo " 2. From the list of hardware devices, select AirPort."
echo " 3. Set this service to "Inactive" by clicking the gear sign and selecting "Make Service Inactive". Remove service if required by site requirements by clicking the minus sign. [From the "Configure" pop-up menu, choose “Manually”.]"
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38536r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Unused hardware devices must be disabled for Bluetooth."
echo " 1. Open System Preferences -- Network."
echo " 2. From the list of hardware devices, select Bluetooth."
echo "[FIX] Ensure the "Status" is set to "Inactive". If the service is not inactive or removed, this is a finding."
echo " 1. Open System Preferences -- Network."
echo " 2. From the list of hardware devices, select Bluetooth."
echo " 3. Set this service to "Inactive" by clicking the gear sign and selecting "Make Service Inactive". Remove service if required by site requirements by clicking the minus sign. [From the "Configure" pop-up menu, choose “Manually”.] "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38538r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Unused hardware devices must be disabled for Firewire."
echo " 1. Open System Preferences -- Network."
echo " 2. From the list of hardware devices, select Firewire."
echo "[FIX] Ensure the "Status" is set to "Inactive". If the service is not set to inactive or removed, this is a finding."
echo " 1. Open System Preferences -- Network."
echo " 2. From the list of hardware devices, select Firewire."
echo " 3. Set this service to "Inactive" by clicking the gear sign and selecting "Make Service Inactive". Remove service if required by site requirements by clicking the minus sign. [From the "Configure" pop-up menu, choose “Manually”.] "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37247r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System Preferences must be securely configured so IPv6 is turned off if not being used."
echo " 1. Open System Preferences -- Network."
echo " 2. Click Advanced."
echo " 3. Click the TCP/IP tab."
echo "[FIX] Ensure "Configure IPv6" is set to "Off". If option is not set to "Off", this is a finding. This must be checked on all network interfaces"
echo " 1. Open System Preferences -- Network."
echo " 2. Click Advanced."
echo " 3. Click the TCP/IP tab and set "Configure IPv6" to "Off", if not actively being used. Note: This must be disabled on each network interface."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38539r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Auto play of movies must be disabled."
echo " 1. Open System Preferences -- QuickTime, Browser Pane."
echo "[FIX] Ensure "Play Movies Automatically" is not checked. If the option is checked, this is a finding."
echo " 1. Open System Preferences -- QuickTime, Browser Pane."
echo " 2. Deselect "Play Movies Automatically"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38539r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Auto play of movies must be disabled."
echo "[NOTE] Could not find this one in the preferences."
echo " 1. Open System Preferences -- QuickTime, Browser Pane."
echo "[FIX] Ensure "Play Movies Automatically" is not checked. If the option is checked, this is a finding."
echo " 1. Open System Preferences -- QuickTime, Browser Pane."
echo " 2. Deselect "Play Movies Automatically"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38217r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The disk cache for movies must be disabled."
echo "[NOTE] Could not find this one in the preferences."
echo " 1. Open System Preferences -- QuickTime, Browser Pane."
echo "[FIX] Ensure "Save Movies in disk cache" is not checked. If option is checked, this is a finding."
echo " 1. Open System Preferences -- QuickTime, Browser Pane."
echo " 2. Deselect "Save Movies in disk cache"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38557r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] QuickTime Advanced preferences must be securely configured."
echo "[NOTE] Could not find this one in the preferences."
echo " 1. Open System Preferences -- QuickTime."
echo " 2. Click Advanced tab."
echo "[FIX] Ensure "Enable Kiosk Mode" is selected. If setting is not checked, this is a finding."
echo " 1. Open System Preferences -- QuickTime, Advanced Pane."
echo " 2. Select "Enable Kiosk Mode"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38560r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] A password must be required to wake a computer from sleep or screen saver."
echo " 1. Open System Preferences -- Security."
echo " 2. Select General tab."
echo "[FIX] Ensure "Require password to wake this computer from sleep or screen saver" is checked. If option is not checked, this is a finding."
echo " 1. Open System Preferences -- Security."
echo " 2. Select General tab."
echo " 3. Select "Require password to wake this computer from sleep or screen saver"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37251r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic login must be disabled."
echo " 1. Open System Preferences -- Security."
echo " 2. Select General tab."
echo "[FIX] Ensure "Disable automatic login" option is checked. If option is not checked, this is a finding."
echo " 1. Open System Preferences -- Security."
echo " 2. Select General tab."
echo " 3. Select "Disable automatic login"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37254r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] A password must be required to unlock each System Preference Pane."
echo " 1. Open System Preferences -- Security."
echo " 2. Select General tab."
echo "[FIX] Ensure "Require password to unlock each System Preferences Pane" is checked. If option is not checked, this is a finding."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo " 3. Select "Require password to unlock each System Preferences Pane"." 
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37262r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic logout due to inactivity must be disabled."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo "[FIX] Ensure "Log out after x minutes of inactivity" is not checked. If it is checked, this is a finding." 
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo " 3. Deselect "Log out after x minutes of inactivity"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37263r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Secure virtual memory must be used."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo "[FIX] Ensure "Use Secure Virtual Memory" is checked. If option is not checked, this is a finding."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo " 3. Select "Use Secure Virtual Memory"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38561r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Remote control infrared receiver must be disabled."
echo "[CHECK] If you deleted the Kext file(s) for infrared in a previous step, you won't find this in the preferences."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo "[FIX] Ensure "Disable remote control infrared receiver" is checked. If the option is not checked, this is a finding."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select General tab. "
echo " 3. Select "Disable remote control infrared receiver"." 
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38563r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Only essential services must be allowed through firewall." 
echo " 1. Open System Preferences -- Security. "
echo " 2. Select Firewall tab. "
echo " 3. Select Advanced."
echo "[FIX] Review the Allowed services, only essential services and applications should be allowed. If not, this is a finding."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select Firewall tab. "
echo " 3. Select the Advanced button. "
echo " 4. Remove any non-essential services and applications. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38565r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Firewall logging must be enabled."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select Firewall tab. "
echo " 3. Click on Advanced. "
echo "[FIX] Ensure "Enable Firewall logging" is checked. If option is not checked, this is a finding. If the Mac OS X firewall has not been configured this setting will be unavailable."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select Firewall tab. "
echo " 3. Click on Advanced. "
echo " 4. Select "Enable Firewall logging". "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37266r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Stealth Mode must be enabled on the firewall. This check applies to mobile platforms only."
echo " 1. Open System Preferences -- Security. "
echo " 2. Select Firewall tab. "
echo " 3. Click on Advanced. "
echo "[FIX] Ensure "Enable Stealth mode" is checked. If the option is not checked, this is a finding." 
echo " 1. Open System Preferences -- Security. "
echo " 2. Select Firewall tab. "
echo " 3. Click on Advanced. "
echo " 4. Select "Enable Stealth mode". "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37268r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] DVD or CD Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure "DVD or CD Sharing" service does not have the "On" box checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "DVD or CD Sharing" service. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37273r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Screen Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure "Screen Sharing" service does not have the "On" box checked. If the box is checked, this is a finding." 
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Screen Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37274r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] File Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "File Sharing" service is not checked. If the box is checked, this is a finding." 
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "File Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37278r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Printer Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Printer Sharing" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Printer Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37282r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Web Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Web Sharing" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Web Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37284r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Remote Login must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Remote Login" service is not checked. If the box is checked, this is a finding."
echo "1. Open System Preferences -- Sharing. "
echo "2. Uncheck the "On" box for "Remote Login" service. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37288r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Apple Remote Desktop must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Remote Management" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Remote Management" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37290r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Remote Apple Events must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Remote Apple Events" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Remote Apple Events" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37293r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Xgrid Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Xgrid Sharing" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Xgrid Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID]: SV-37296r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Internet Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Internet Sharing" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Internet Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37299r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Bluetooth Sharing must be disabled."
echo " 1. Open System Preferences -- Sharing. "
echo "[FIX] Ensure the "On" box for "Bluetooth Sharing" service is not checked. If the box is checked, this is a finding."
echo " 1. Open System Preferences -- Sharing. "
echo " 2. Uncheck the "On" box for "Bluetooth Sharing" service."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38567r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Mail must be configured using SSL. If you are not using the Mac Mail Application, this check does not apply."
echo " 1. Choose Mail ] Preferences, and then click Accounts. "
echo " 2. Select an account, and then click Advanced. "
echo " 3. Ensure "Use SSL" is selected. "
echo "[FIX] From the Authentication pop-up menu, ensure an authentication method is selected [e.g., MD5 Challenge-Response, NTLM, Kerberos Version 5 [GSSAPI], or Authenticated POP [APOP]]. If not, this is a finding."
echo " 5. Click Account Information. "
echo " 6. From the Outgoing Mail Server [SMTP] pop-up menu, select Edit Server List. "
echo " 7. From the server list, select the outgoing mail server, and then click Advanced. "
echo " 8. Ensure Secure Socket Layer [SSL] is selected. "
echo "[FIX] From the Authentication pop-up menu, ensure an authentication method is selected [e.g., MD5 Challenge-Response, NTLM, Kerberos Version 5 [GSSAPI], or Authenticated POP [APOP]]. If not, this is a finding."
echo " 1. Choose Mail ] Preferences, and then click Accounts. "
echo " 2. Select an account, and then click Advanced. "
echo " 3. Select "Use SSL". "
echo " 4. From the Authentication pop-up menu, select authentication method [e.g., MD5 Challenge-Response, NTLM, Kerberos Version 5 [GSSAPI], or Authenticated POP [APOP]]. "
echo " 5. Click Account Information. "
echo " 6. From the Outgoing Mail Server [SMTP] pop-up menu, select Edit Server List. "
echo " 7. From the server list, select your outgoing mail server and then click Advanced. "
echo " 8. Select "Secure Socket Layer [SSL]". "
echo " 9. From the Authentication pop-up menu, select authentication method [e.g., MD5 Challenge-Response, NTLM, Kerberos Version 5 [GSSAPI], or Authenticated POP [APOP]]."
echo " 10. Close the preferences window, and then click "Save" in the message that appears. "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37301r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] iTunes Store must be disabled."
echo " 1. Open Finder."
echo " 2. Select Applications."
echo " 3. Double click the iTunes application."
echo " 4. On the top menu bar click iTunes and from the drop down menu select Preferences."
echo "[FIX] Click on the Parental icon. Verify the Disable iTunes Store is checked. If not, this is a finding."
echo " 1. Open Finder."
echo " 2. Select Applications."
echo " 3. Double click the iTunes application."
echo " 4. On the top menu bar click iTunes and from the drop down menu select Preferences."
echo " 5. Click on the Parental icon."
echo " 6. Click on the Disable iTunes Store option. This must be performed for each user."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37303r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Finder must be set to always empty Trash securely. In Mac OS X Finder can be configured to always securely erase items placed in the Trash. This prevents data placed in the Trash from being restored"
echo " 1. Open Finder --  Preferences  --  Advanced. "
echo "[FIX] Ensure "Empty Trash Securely" is checked. If the option is not checked, this is a finding. This must be done for each user on the system."
echo " 1. Open Finder --  Preferences  --  Advanced. "
echo " 2. Select "Empty Trash Securely"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37308r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] iDisk must be removed from Finder sidebar."
echo " 1. Open Finder ] Preferences ] Sidebar. "
echo "[FIX] Ensure the iDisk icon is not selected. If the option is selected, this is a finding. This must be done for each user on the system."
echo " 1. Open Finder  --  Preferences  --  Sidebar."
echo " 2. De-select the iDisk icon. This must be done for each user on the system."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38568r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The root account must be disabled."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Lock and enter the password to unlock the options."
echo "[FIX] Click the Edit tab [Directory Utility bar on top] and verify the "Disable Root User" option appears. If the "Enable Root User" option is visible, this is a finding."
echo " 1. Open Finder."
echo " 2. Click the Hard Drive icon."
echo " 3. Double Click System."
echo " 4. Double Click Library."
echo " 5. Double Click CoreServices."
echo " 6. Double Click Directory Utility."
echo " 7. Click the Lock and enter the password to unlock the options."
echo " 8. Click Disable Root User."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37313r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Shared User Accounts must be disabled."
echo " Interview the SA to determine if any shared accounts exist. Any shared account must be documented with the IAO. Documentation should include the reason for the account, who has access to this account, and how the risk of using a shared account [which provides no individual identification and accountability] is mitigated."
echo " Note: As an example, a shared account may be permitted for a help desk or a site security personnel machine, if the machine is stand-alone and has no access to the network."
echo "[FIX] Remove any shared accounts not meeting the exception requirements listed."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-38572r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Automatic Screen Saver initiation must be enabled when smart card is removed from machine."
echo " 1. Open System Preferences. "
echo " 2. Click the Security Icon."
echo " 3. Click the General Tab."
echo "[FIX] Ensure "Activate screen saver when login token is removed" option is selected. If the option is not selected, this is a finding. If you are not using a smart card application this check does not apply."
echo " 1. Open System Preferences. "
echo " 2. Click the Security Icon."
echo " 3. Click the General Tab."
echo " 4. Select "Activate screen saver when login token is removed"."
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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
echo "[STIG ID] SV-37331r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Spotlight Panel must be securely configured."
echo " 1. Open System Preferences."
echo " 2. Click the Spotlight Icon."
echo " 3. In the Search Results pane, verify the categories not wanted as searchable by Spotlight are unchecked."
echo " 4. Click the Privacy pane."
echo "[FIX] Verify the correct folders and disks are in the Privacy pane; these are not searchable by Spotlight. If searchable categories or folders are found that should not be searchable, this is a finding."
echo " 1. Open System Preferences."
echo " 2. Click the Spotlight Icon."
echo " 3. In the Search Results pane, deselect categories not wanted searchable by Spotlight."
echo " 4. Click the Privacy pane."
echo " 5. Click the Add button or drag a folder or disk into the Privacy pane."
echo " 6. Folders and disks in the Privacy pane are now not searchable by Spotlight.  "
echo ""
echo "Enter 0 to skip this STIG/continue to the next."
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


echo ""
echo "--------------------------------------------------------"
echo "And finally, the 100% manual [logical] tasks."
echo "Couldn't automate any of these, or didn't want to."
echo ""
read -p "If you're ready to continue, hit 'Return'."
echo "--------------------------------------------------------"
echo ""


echo "---------------------------"
echo "[STIG ID] SV-38067r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not have a public Instant Messaging [IM] client installed."
echo "[FIX] If an IM client is installed, ask the SA if it has access to any public domain IM servers. If it does have access to public servers, this is a finding. Uninstall the IM client from the system, or configure the client to only connect to DoD-approved IM services."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-38068r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] The system must not have any peer-to-peer file-sharing application installed."
echo "[FIX] If any of these applications are installed, this is a finding. Uninstall the peer-to-peer file sharing application[s] from the system."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-38524r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] An antivirus tool must be installed." 
echo "[FIX] Verify an approved antivirus tool is installed on the system. Verify an approved antivirus tool is installed on the system."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-38583r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Physical security of the system must meet DoD requirements. Interview the SA to determine if equipment is located in a controlled access area."
echo "[FIX] Relocate equipment to a controlled access area."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-37320r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] System Recovery Backup procedures must be configured to comply with DoD requirements."
echo "Interview the SA to determine if system recovery backup procedures are in place complying with DoD requirements. Any of the following would be a finding: 
echo "The site does not maintain emergency system recovery data.
echo "The emergency system recovery data is not protected from destruction and stored in a locked storage container. 
echo "The emergency system recovery data has not been updated following the last system modification.
echo "[FIX] Implement data backup procedures complying with DoD requirements."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-37322r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] An Emergency Administrator Account must be created. Interview the SA to determine if an emergency administrator account exists and is stored with its password in a secure location."
echo "[FIX] Create and maintain an emergency administrator account for emergency situations."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-37325r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Default and Emergency Administrator passwords must be changed when necessary."
echo "[FIX] Interview the SA or IAM to determine if the site has a policy requiring the default and backup administrator passwords to be changed at least annually or when any member of the administrative team leaves the organization. Define a policy for required password changes for the default and backup administrator account."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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
echo "[STIG ID] SV-37329r1_rule"
echo "---------------------------"
echo ""
echo "[CHECK] Application/service account passwords must be changed at least annually or whenever a system administrator with knowledge of the password leaves the organization. The site should have a local policy ensuring passwords for application/service accounts are at least 15 characters in length and meet complexity requirements for all passwords. Application/service account passwords manually generated and entered by a system administrator must be changed at least annually or whenever a system administrator with knowledge of the password leaves the organization."
echo "[FIX] Interview the system administrators on their policy for application/service accounts. If it does not meet the above requirements, this is a finding. Create application/service account passwords at least 15 characters in length and meet complexity requirements. Change application/service account passwords are manually generated and entered by a system administrator at least annually or whenever an administrator with knowledge of the password leaves the organization."
echo ""
echo "Enter 0 to confirm you have verified this STIG."
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

echo "--------------------------------------------------------"
echo ""
echo "All done. STIG Remediation complete." 
echo "I'm now taking you back to the menu."
echo "After reviewing system and logs for completion, reboot."
press_enter
echo "--------------------------------------------------------"
exec ./script.sh 2>and1 | tee script.$TODAYSDATE.log

# END