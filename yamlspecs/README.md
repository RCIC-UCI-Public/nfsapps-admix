This where we create modules for NFS installed software.

NFS-installed software should be used *sparingly* in HPC3 - nevertheles, it's something
that we must support

There must be a valid reason to install in NFS instead of making a regular package. The following
reasons are considered valid

       1.  Commercial software that isn't already packaged, and/or has a strange/interactive install.
       2.  Software with a very large footprint (large might be > 3GB installed)

Here is the list of software and rationale for inclusion as NFS-installed

| Software | Rationale | When Updated |
|----------|-----------|--------------|
|Intel oneAPI | Very large (20GB) | 25 March 2020 |


How to add new software.  

Note: Please use the oneAPI install as a model of things that should be done.

1. On HPC3, applications are installed in '''/data/opt/apps'''. This mirrors the install root for 
   most locally-installed applications '''/opt/apps'''.
2. Create a directory '''/data/opt/sources/<application>'''
3. Create a module file using the existing yaml2rpm templates. Modulefiles are installed on all nodes
4. Place a README, tarballs, any other information for how the software was installed.
   - When you actually install, create a file called install-<date of install> with notes of
     exactly what you did. 
5. Mirror everything except the tarball(s) in <application> subdirectory of this repository.  For
   example, one oneAPI, README, silent.cfg, and install-<date> are in this directory.
6. Never (almost never) should you check in a binary tarball.

