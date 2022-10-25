# The code is no longer being maintained. The repo is kept for historical reasons.

## na2-exec-nsi-scripts

OpenNSA NSI scripts that can be used e.g. with [NA2 exec plugin](https://github.com/RENCI-NRIG/na2-exec-plugin). In general they turn execution of onsa client from OpenNSA into one-shot operation that returns error codes or exits with status 0. 

## Setup

The scripts require an installation of OpenNSA somewhere and adjusting the `env.bash` script. All scripts take some command-line parameters, using `-h` will explain the use. For testing provisioning requests there is a special `-l params.sh` option that sources an additional file filled with sane values for provisioning a connection. 

## More information 

[ExoGENI doc repo](https://github.com/RENCI-NRIG/exogeni/tree/master/software/nsi)
