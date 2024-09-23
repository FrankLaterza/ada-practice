# My ada notes
This is a repo for notes on using ada and example file and proj that will help me understand ada.


SOURCE: https://www.wiremoons.com/development/ada/install/2020/12/19/## 

# Ubuntu 20.10 GNAT Installation

Installing basic FSF GNAT Ada language compiler support on Ubuntu 20.04 (or other releases too!) is done with the local package manager.

The command shown below can be entered into a Terminal window on Ubuntu. As with any use of the sudo command, your administrator or root password will need to be entered when prompted:

First ensure the latest packages are known to your computer: 
```
sudo apt update
```

Next install the GNAT compiler tools: 
```
sudo apt install gnat
```

Add gprbuild tool support and a debugger: 
```
sudo apt install gprbuild gdb
```

A handy extra is a copy of the current Ada Language Reference Manual (ARM): 
```
sudo apt install ada-reference-manual-2012
```

That is enough for a basic but robust Ada development environment that can be used from the command line to build basic programs.

However, it is also useful to have access to additional supporting language libraries. These too can be added via the Ubuntu package manager as follows. The libraries suggested here are a personal choice, but do match up with most of those included by default with the AdaCore Community Edition installation too. The packages (i.e., libraries) are:

- **asis-programs**: a number of useful tools such as gnatpp, gnatcheck, gnattest, etc;
- **libaws19-dev**: Ada Web Server (AWS) and other useful related development files;
- **libcurl4-openssl-dev**: development library for SSL use related development files by Ada Web Server (AWS);
- **liblzma-dev**: compression support development library;
- **libgnatcoll-gmp19**: part of the GNAT collection (GNATColl) general purpose Ada library;
- **libgnatcoll-gmp18-dev**: development support for the GNATColl;
- **libgnatcoll18**: more support for the GNATColl;
- **libgnatcoll18-dev**: more development support for the GNATColl;
- **libgnatcoll-doc**: GNATColl documentation;
- **libgnatcoll-iconv18-dev**: GNATCall static library and Ada specifications for the binding with the Iconv C library;
- **libgnatcoll-readline18-dev**: GNATColl development support for Readline library;
- **libgnatcoll-sqlite18-dev**: GNATColl database support for SQLite development;

To install all the above, run the command:
```bash
sudo apt -y install asis-programs libaws19-dev libcurl4-openssl-dev liblzma-dev \
        libgnatcoll-gmp19 libgnatcoll-gmp18-dev libgnatcoll18 libgnatcoll18-dev \
        ada-reference-manual-2012 libgnatcoll-doc \
        libgnatcoll-iconv18-dev libgnatcoll-readline18-dev libgnatcoll-sqlite18-dev
```

To install everything explained above in a single command, you can run it as:
```bash
sudo apt -y install gnat gprbuild gdb asis-programs \
        libaws19-dev libcurl4-openssl-dev liblzma-dev \
        libgnatcoll-gmp19 libgnatcoll-gmp18-dev libgnatcoll18 libgnatcoll18-dev \
        ada-reference-manual-2012 libgnatcoll-doc \
        libgnatcoll-iconv18-dev libgnatcoll-readline18-dev libgnatcoll-sqlite18-dev
```

You can make sure the installed tools and programs are all working, and see what versions are included by running the following command from the terminal:
```bash
gnatmake --version
gprbuild --version
gnatls -v
gnat --version
```

If you are running Ubuntu as a desktop, you can also add the GNAT Programming Studio (GPS) which is an Ada (and C) Integrated Development Environment (IDE) as well. This provides a graphical development environment, built-in file editing; HTML-based help system; complete compile/build/run cycle; intelligent source navigation; project management; and much more. This is also provided by default with the AdaCore Community Edition. To install it, run the following command in a Terminal:
```bash
apt install gnat-gps
```

Once installed, the GNAT Programming Studio (GPS) application will be available with all the other Ubuntu applications you have installed.

If you want to see more detailed information about any of the above Ubuntu packages before you install them on your computer, use the command:
```bash
apt info <packagename>
```

So for example, to see information all about GPS, use the command:
```bash
apt info gnat-gps
```

That’s it!! Time to build or develop some Ada programs…

Citations:
[1] https://www.wiremoons.com/development/ada/install/2020/12/19/Install-GNAT-Ada-Compiler-on-Ubuntu.html
