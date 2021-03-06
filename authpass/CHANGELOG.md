# 1.6.5

* WebDav: Connect UI: Make dialog scrollable. #103
* WebDav: Fixed Compatibility with servers returning trailing slashes for directories.
* Linux: support for keyring storage (for Dropbox, Google Drive, WebDav, One Drive)

# 1.6.4

* Group Management/Filter: Add Drawer for easy filtering by Groups.
* Fixed saving files in Dropbox root folder.
* Use default colors when opening files (do not use gray).
* iOS: Support for Quick Unlock with Face ID.
* MacOS: Fixed adding file attachments.
* Android: Allow installation on sdcard.

# 1.6.3

* Initial support for Linux
* Fix OTP codes with spaces in 'TOTP Seed' field #26
* Password List: Improved search by search for each word separately.
* iOS: added iCloud capability to fix local file crashes on ios <= 10

# 1.6.2

* Revamped Group management, filtering and editing, support for changing icons, renaming, deleting.
* MacOS: Fixed font for older MacOS Versions

# 1.6.1

* Support for Microsoft OneDrive (#71)
* Improved Authorization flow for Dropbox.
* Allow customizing of visual density and font scale.
* TOTP: Disable OTP secret padding (makes it more compatible with e.g. GitHub, Amazon, etc.)
* TOTP: Fix barcode scanner (missing camera permissions)

# 1.6.0

* Added support for file attachments/binaries.
* Filter by groups, show/hide deleted trash items, etc.
* Fix reading/writing timestamps correctly.
* Fix compatibility problems with kdbx 4 timestamps.
* Correctly display modification timestamp in local time zone.

# 1.5.8 - 2020-04-06

* Critical bugfix, Error opening files with missing Recycle Bin.
 
# 1.5.7 - 2020-04-05

* By default hide recycle bin/deleted items, allow changing of filter by group.
* Add `Help` menu item to open https://authpass.app/docs/
* Fix potential bug in argon2 hashing.

# 1.5.6 - 2020-04-27

* Android: Add file handler to open  *.kdbx files.
* Android/iOS: Improved opening of existing files through document picker APIs.
  * Previously changes were not correctly persisted back to the original location.
* Android: Improved autofill username/password field detection.
* fixed appbar menu not refreshing correctly.

# 1.5.5

* Allow changing of database name.
* Large Screens (Tablet/Desktop): Improved responsiveness of search box.
* Update flutter dependency to 1.17 (beta).
* Fixed potential crash on iOS file picker. 
  https://github.com/miguelpruivo/flutter_file_picker/issues/200
* Decryption: Improved performance and fixed potential crash
  for larger kdbx files.

# 1.5.3

* Fixed a few dark mode problems, Fixed potential crash.

# 1.5.2

* Support for AES-KDF and ChaCha20
* Fixed bugs/compatibility with keyfiles in hex and base64 formats.

# 1.5.0

* Initial support for kdbx 4.0 🎉️
* Add support for 2fa (2nd Factor Authentication) based on Time-based One Time Passwords (TOTP).

# 1.4.2

* Added dark mode - either through configuration, or taken from android 10 system.
* Show groups/categories of password entries
* Allow basic management of groups/categories.
* Added built-in way to send log file via email to support.

# 1.4.0

* Add support for 2fa (2nd Factor Authentication) based on Time-based One Time Passwords (TOTP).
* A couple of bug fixes and improvements to error messages.

See also https://authpass.app/articles/time-based-one-time-tokens-for-2nd-factor-otpauth/

# 1.2.1

* Fixed bug which made search field lose focus while typing.
* Fixed entry editing inconsistencies when protected values or creating new passwords.

# 1.2.0

* Initial support for Android AutoFiill Service (Activate in the Preferences)
* Support for WebDAV (e.g. for using with NextCloud, OwnCloud)
* Many other usability improvements and bug fixes.

# 1.0.2

* A few UI improvements and bug fixes. * Improved kdbx 2.x compatibility.

# 1.0.0

Initial release 🎉️
