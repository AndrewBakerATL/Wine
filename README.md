# Wine
A set of instructions for those installing wine on debian-based Linux distributions, designed to give the program loader and winetricks.<br>
<br>
![Photoshop](https://media.discordapp.net/attachments/510282789006868491/625562494618042379/unknown.png?width=972&height=547)
Note: Proof that it works, running Photoshop CC above in, or through, wine.
<br>
<br>
## What is Wine, or W.I.N.E.?
Well, the literal translation is, Wine Is Not an Emulator. To put it simple, while Wine is a program loader, you could desribe it more like an on-the-fly instruction set that works in-tandem with Linux. Essentially what it does is allow Linux tp parse / read executable files, based on realtime translation.

## Requirements
Tested with:<br>
`Ubuntu-based Distro (Ubuntu, Kubuntu, Mint, Deepin, Elementary)`<br>
`Wine 4.0+`<br>
`Linux Kernel 5.0+`<br>
`Kubuntu / Ubuntu 19.04`<br>
# Installation
This is assuming you don't have wine installed at all on your system. If you do, remove it by using the following command(s) `sudo apt purge wine` or `sudo apt purge wine*` *and* `sudo apt purge wine:1386`<br>
<br>
First we need to add the architecture and get the key with this:<br>
* Architecture: `sudo dpkg --add-architecture i386`<br>
* Key: `wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -`<br>
<br>
After, we need to add the actual repository:<br>
Note: Rather than adding each command for each release structure, I'll just explain the process. Each Ubuntu release is given a reference name, which is later referenced in various PPA's. To edit this, or check for a newer release, just amend that name to the newer version (ie: Disco, Bionic, Xenial).<br>
<br>
Ubuntu 19.04: `sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'`<br>

Now, to install the actual Wine application, use the following:<br>
First, we need to update the actual repository we just added with `sudo apt-get update`. Afterwards, we can check for the package(s) with `sudo apt-get install --install-recommends winehq-stable`. After, go ahead and check the installation and version with `wine --version`.<br>

Personally, I recommend to install Winetricks. It's a utility that allows you to manage your prefixes, as well as giving an arguably better GUI for many of Wine's functions, even adding some of its own. To do so, use (assuming you're at a location via CLI where you want to download it): `wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks`. Then use, `chmod +x winetricks`.

The last command is going to actually establish your wine prefix and set it up for operation. You want to run the following command, but the paths have to be accurate in the command line. I'll go ahead and add the common paths for most users:<br>

`WINEPREFIX=~/.wine wineboot -u WINEARCH=win64 WINEPREFIX=~/.wine winetricks fontsmooth=rgb gdiplus vcrun2008 vcrun2010 vcrun2012 vcrun2013 vcrun2015 atmlib msxml3 msxml6 gdiplus corefonts`<br>
<br>
Note: If it prompts you to install Mono & Gecko, install them. They're needed often for compatibility purposes, especially in running the above application, Photoshop.

### F.A.Q.
How does it work?<br>
**A:** See above description under "What is Wine?" If that still doesn't make sense to you, I'm not really sure how to describe it in simpler terms that would, not that this is meant to be offensive.

Can I run anythinfontsmoothg?<br>
**A:** Yes and no. Technically, wine only offers translation for core windows files / extensions. So you might be able to run and parse executable, as well as their .dll's, but that doesn't in-turn mean that you'll be able to set up every dependency that a program might need. Some are available, some aren't. Many mainstream programs and games can be ran though. Another thing to note is that it depends on which prefix you use. In some cases, 64-bit wine prefixes / installations *can't* actually run 32-bit applications. It's possible to have both prefix types installed, but it's a little more complicated.

Is Wine resource intensive?<br>
**A:** Well, it kind of depends on how you run it. Wine gives the option to parse and render applications in one of two ways. You can either have it render a full windows desktop in a smaller resolution, something akin to a virtual machine / virtualbox, or have it render the applications only in your current desktop environment. This can also deend on which version of Wine you're using (ie: Dev build, Staging, etc.)

### Troubleshooting
Winetricks didn't install for me, what do I do?<br>
**A:** It's not completely necessary, but if you want it, you can install it via your package manager with `sudo apt install winetricks` and it should adapt.
