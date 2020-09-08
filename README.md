# Dotfiles
> My dotfiles repository - managed by gnu stow

## README is not up to date!

## Table of Contents
* [bash - aliases and functions](#bash)
* [bin - my toolbox](#bin)
  * [afk - away from keybard](#afk)
  * [cleaning-time - for dusty input devices](#cleaning-time)
  * [clonecd - combination of git clone and cd](#clonecd)
  * [easytar - a shortcut for tar commands](#easytar)
  * [file2base64 - convert file to base64 hash](#file2base64)
  * [file2qr - convert file to qr code](#file2qr)
  * [fs - determine file sizes](#fs)
  * [gz - compare gzipped file size with the original size](#gz)

## bash - aliases and functions
The `bash` directory includes dotfiles about bash settings. I prefer to keep my
bash stuffs in seperate files for tidy structure. These are:

* `.aliases`: includes some shortcuts for long commands
* `.functions`: includes usefull bash functions
* `.exports`: includes some export command for many environment variables
* `.bash_prompt`: includes PS1 customization
* `.bashrc`: includes a bootstrap for all the above files and sets several bash
  settings
* `.inputrc`: includes settings about readline

## bin - my toolbox
The `bin` directory includes a lots of scripts for my personal needs.

### afk - away from keyboard
*Current Version: 1.0.0*

Suspends PC now or give time interval for suspend later. It also can countdown
for suspend.

#### Dependency
* systemctl

#### Usage
```txt
Usage: afk [OPTIONS] [NUMBER][SUFFIX]
Suspends PC now. If the NUMBER given, waits for NUMBER second before suspend.
The SUFFIX may be 's' for seconds (the default), 'm' for minutes, 'h' for
hours or 'd' for days.

Options:
  -v, --version    Show afk version number
  -h, --help       Show this help message
```

#### Examples
Instantly suspend:
```sh
$ afk
```
Suspend 2 minutes later:
```sh
$ afk 2m
```
*`m` stands for minutes*

### cleaning-time - for dusty input devices
*Current version: 1.0.0*

Disables your input devices awhile for cleaning input devices. This script
prevents any possible unwanted situations while cleaning devices. It's waits for
given time interval (defaults 30 seconds) than re-enables your input devices.
Also you can disable only keyboard or mouse devices with optionally.

#### Dependency
* xinput

#### Configuration
On first usage, the script needs to know the IDs of your input devices. So run
`xinput list` in your terminal and find the IDs of your input devices. Then open
this script file with your favorite text editor and write the device IDs
`keyboard_devices` and `mouse_devices` variables seperated with spaces.

Note that, input device's ID may change after rebooting the system.

#### Usage
```txt
Usage: cleaning-time [OPTIONS] [NUMBER]
Disables given input devices for the NUMBER seconds. The defaults is 30
seconds.

Options:
  -k, --keyboard-only    Disables only keyboard devices
  -m, --mouse-only       Disables only mouse devices
  -v, --version          Show cleaning-time version number
  -h, --help             Show this help message
```
#### Important
Please be careful before run this script. Because this script disables your
input devices awhile. So you CANNOT stop this command while running. DON'T
interrupt this script even If you run with `--mouse-only` option. Because you
are terminating the script without running the enable input devices commands.

#### Examples
Disable all input devices:
```sh
$ cleaning-time
```

Disable only keyboard devices:
```sh
$ cleaning-time [-k|--keyboard-only]
```

Disable only mouse devices:
```sh
$ cleaning-time [-m|--mouse-only]
```

Disable all input devices for 15 seconds:
```sh
$ cleaning-time 15
```
### clonecd - combination of git clone and cd
*Current version: 1.0.0*

`git clone` given repository url and `cd` into it.

#### Dependency
* git

#### Known Issues
##### The script cannot change current directory
The reason is that each process has its own current directory, and
when you execute this script file from the shell it is run in a new
process. Add this line to your `.bashrc` file to fix this issue:
```sh
alias clonecd=". /path/to/clonecd"
```

#### Usage
```txt
Usage: clonecd [OPTIONS] REPO [DIRECTORY]
Git clone the REPO and cd into the directory. The DIRECTORY is an optional
argument. Script uses the DIRECTORY instead of default value REPO.

Options:
  -v, --version    Show clonecd version number
  -h, --help       Show this help message
```

#### Examples
Clone repository and cd into it:
```sh
$ clonecd https://github.com/erenhatirnaz/dotfiles
```

Clone repository with different directory name and cd into it:
```sh
$ clonecd https://github.com/erenhatirnaz/dotfiles my-own-dotfiles
```

### easytar - a shortcut for tar commands
Tar without arguments. Sometimes writing `tar` arguments (ex. `-cvfj`) can be
exhausting. This script makes it easy to create or extract an archive file.
Available tar archive format listed below:
* .tar
* .tar.gz
* .tar.bz2
* .tar.xz

#### Dependency
* tar

#### Usage
```txt
Usage: easytar ARCHIVE.EXT [DIRECTORY]    (1st form)
   or: easytar FILE|DIR... [ARCHIVE.EXT]  (2nd form)
EasyTAR is a shortcut for tar commands.
First form is used for extract the ARCHIVE.EXT. DIRECTORY is an optional
argument and If given extracts the ARCHIVE.EXT into the DIRECTORY. Second form
is used for create archive file. Give one or many file or directory and final
argument is the name of archive file to be created. See EXAMPLES section
below.
```

#### Examples
Create tar archive from a directory:
```sh
$ easytar documents/
# creates documents.tar
```

Create tar.gz archive from a directory with different file name:
```sh
$ easytar documents/ docs.tar.gz
# creates docs.tar.gz
```

Create tar.bz2 archive from 2 file:
```sh
$ easytar a.txt b.txt ab.tar.bz2
# creates ab.tar.bz2
```

Extract tar.gz archive:
```sh
$ easytar docs.tar.gz -> documents/
```

Extract tar.bz2 archive to different directory:
```sh
$ easytar ab.tar.bz2 texts -> texts/a.txt texts/b.txt
```

### file2base64 - convert file to base64 hash
Generates base64 hash from given file. Also can generate as url format
like this: `data:[MIMETYPE]; base64, [HASH];`

#### Dependency
* openssl

#### Usage
```txt
Usage: file2base64 [OPTIONS] FILE
Converts the FILE contents to Base64 hash.

Options:
  -w, --with-url    Prints Base64 hash with `data:` url
  -v, --version     Show file2base64 version number
  -h, --help        Show this help message
```

#### Examples
Create plain base64 hash:
```sh
$ file2base64 config.ini.example
```

Create base64 hash as data url:
```sh
$ file2base64 -w config.init.example
```

### file2qr - convert file to qr code
Generates QR code from the given file. This script prints QR code to
the terminal(STDOUT), but can optionally generate an image file (PNG).

#### Dependecy
* qrencode

#### Usage
```txt
Usage: file2qr [OPTIONS] FILE
Converts content of the FILE to QRCode.

Options:
  -s, --save-as-image    Save QRCode as PNG image
  -v, --version          Show file2qr version number
  -h, --help             Show this help message
```

#### Examples
Generate QR code from a file:
```sh
$ file2qr config.ini
```

Generate QR code from a file and save as image file:
```sh
$ file2qr -s config.ini
```

### fs - determine file sizes
Prints human readable total file size of the given file or directory.

#### Dependency
* du (from gnu coreutils)

#### Usage
```txt
Usage: fs [FILE|DIRECTORY...]
Determine size of the FILE or total size of the DIRECTORY.

Options:
  -v, --version    Show fs version number
  -h, --help       Show this help message
```

#### Examples
Print file size:
```sh
$ fs README.md
```

Print total size of the directory:
```sh
$ fs bin/bin/
```

### gz - compare gzipped file size with the original size
Prints gzipped and original file sizes with ratio.

#### Dependencies
* gzip
* wc
* basename

#### Usage
```txt
Usage: gz FILE
Prints original, gzipped file size and ratio.

Options:
  -v, --version    Show gz version number
  -h, --help       Show this help message
```

#### Examples
Print gzipped and original file size:
```sh
$ gz config.init
```

### httpserver - simple way to serve files
Serves the current directory on localhost:8080. Also you can give
different port number.

#### Dependency
* Python

#### Usage
```txt
Usage: httpserver [OPTIONS] [PORT]
Starts a basic HTTP server in current directory. The PORT is optional argument
and It's default value is 8080. The PORT number have to be 4-digit.

Options:
  -o, --open-with-browser    Open http server url with default browser
  -v, --version              Show httpserver version number
  -h, --help                 Show this help message
```

#### Examples
Serve current directory on `localhost:8080`:
```sh
$ httpserver
```

Serve current directory with different port number:
```sh
$ httpserver 1234
```

Serve current directory and open server's url in default web browser:
```sh
$ httpserver -o 4321
```

### lower - convert text to lowercase
Converts given TEXT to lower case.

#### Dependency
* bash >=4.0

#### Usage
```txt
Usage: lower [OPTIONS] TEXT
   or: echo "TEXT" | lower
   or: lower (interactive mode)
Convert TEXT to lower case.

Options:
  -v, --version    Show lower version number
  -h, --help       Show this help message
```

#### Examples
To convert text to lower case:
```sh
$ lower FOOBAR
```

To use with piping:
```sh
$ echo "FOOBAR" | lower
```

To enter interactive mode:
```
$ lower
```

### man2pdf - convert man pages to pdf file
Converts the man page to a pdf file. This scripts creates the PDF file to
current directory.

#### Dependency
* ps2pdf (from `ghostscript` package)

#### Usage
```txt
Usage: man2pdf [OPTIONS] MANPAGE
Converts the MANPAGE to a PDF file.

Options:
  -v, --version    Show man2pdf version number
  -h, --help       Show this help message
```

#### Examples
To convert a manpage to an pdf file:
```sh
$ ps2pdf emacs
# creates emacs.pdf
```

### mkcd - create a directory and cd into it
*Current version: 1.0.0*

Creates a directory with given name and `cd` into it. Also can initialize git
repository optionally.

#### Dependency
* git

#### Usage
```txt
Usage: mkcd [OPTIONS] DIRECTORY
Create the DIRECTORY and cd into it.

Options:
  -g, --git-init   Initialize git repository in the DIRECTORY
  -v, --version    Show mkcd version number
  -h, --help       Show this help message
```

#### Examples
To create a directory and cd into it:
```sh
$ mkcd foobar
```

To create a directory, cd into it and initalize git repository:
```sh
$ mkcd -g foobar
```

### phpserver - localhost for php project
Starts built-in php server in the current directory. Default port number is
4000, but you can give different port number.

#### Dependecy
* php >=5.7

#### Known Issues
##### The script cannot change current directory
The reason is that each process has its own current directory, and
when you execute this script file from the shell it is run in a new
process. Add this line to your `.bashrc` file to fix this issue:
```sh
alias phpserver=". /path/to/phpserver"
```

#### Usage
```txt
Usage: phpserver [OPTIONS] [PORT]
Starts PHP server in current directory. The PORT is optional variable and It's
default value is 4000. The PORT number have to be 4-digit.

Options:
  -o, --open-with-browser    Open http server url with default browser
  -v, --version              Show phpserver version number
  -h, --help                 Show this help message
```

#### Example
To start php server:
```sh
$ phpserver
```

To start php server with different port number:
```sh
$ phpserver 1234
```

To start php server and open server's url in default web browser:
```sh
$ phpserver -o

```

### tre - tree with some excludes
A shorthand for tree with hidden files and color enabled, ignoring some
developer environment directories (such as `.git`,`node_modules`), listing
directories first.

#### Dependencies
* basename (from coreutils package)
* tree

#### Usage
```txt
Usage: tre [DIR]
Tre is a shorthand for tree with hidden files and color enabled, ignoring some
developer environment directories (such as .git, node_modules), listing
directories first. The output gets piped into `less` with options to
preserve color and line numbers, unless the output small enough for one
screen.

Options:
  -v, --version    Show tre version number
  -h, --help       Show this help message
```

#### Examples
To print current directory structure:
```sh
$ tre
```

To print another directory structure:
```sh
$ tre ~/code
```

### upper - convert text to uppercase
Converts given text to upper case.

#### Dependency
* bash >=4.0

#### Usage
```txt
Usage: upper text
   or: echo "text" | upper
   or: upper (interactive mode)
Convert TEXT to upper case.

Options:
  -v, --version    Show upper version number
  -h, --help       Show this help message
```

#### Examples
To convert text to upper case:
```sh
$ upper foobar
```

To use with piping:
```sh
$ echo "foobar" | upper
```

To enter interactive mode:
```
$ upper
```

### you2mp3 - download a youtube video as mp3 file

#### Dependency
* youtube-dl

#### Usage
```txt
Usage: you2mp3 [OPTIONS] YOUTUBE_URL
Download YouTube video as mp3 audio file.

Options:
  -v, --version    Show you2mp3 version number
  -h, --help       Show this help message
```

#### Examples
To download youtube video as mp3:
```sh
$ you2mp3 https://www.youtube.com/watch?v=lt-udg9zQSE
```

## emacs
I'm using emacs as text editor and programming environment. Also I'm planning
to adapt emacs to my life more:

I'm managing my emacs's packages with [Cask](https://github.com/cask/cask)
tool. [Here](emacs/.emacs.d/Casko) is my all package list.
