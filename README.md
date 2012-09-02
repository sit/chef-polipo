Description
===========
Install polipo proxy from package manager.
Add polipo as a service and start immediately.

There is a single recipe default and a simple template configuration file that allows full external access to the proxy and adds logging.

The logging is set to the maximum level (0xFF, see https://github.com/jech/polipo/blob/master/log.h). This is overly intrusive, but greatly useful for debugging.

Requirements
============

Installs through package manager so should work on any Unix/Linux platform.

Tested on ArchLinux

Usage
=====

To use default recipe
  recipe[polipo]

Issues
=====
On ArchLinux chef can not accurately determine the status using `/etc/rc.d/polipo status`. It is always assumed that the service is already started, and this is a problem when it is not and we want to start it.
To workaround, status is not marked as supported, forcing chef into a manual check which accurately shows the status.

Contributing
=====
This cookbook has been tested only on ArchLinux. If you have it working on other distros then do let me know.
Pull requests for distro support, additional configuration, etc are always welcome.
