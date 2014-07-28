lantern-docs
============

## Design and implementation docs for the Lantern projects

To setup the project:

    # init project
    tx-init --user=<transifex-username> --pass=<transifex-password>
 
    # setup transifex
    Add credentials to ~/.transifexrc
    Transifex instance [https://www.transifex.com/projects/p/lantern/]:
    pip install transifex-client

    # pull latest translations
    tx pull 

    # push updates to translations
    tx push -t

