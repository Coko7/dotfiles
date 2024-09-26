# .dotfiles

All my Linux configuration files. I use this to configure my entire system.

## 🐧 System setup

- Operating system: [Arch Linux](https://archlinux.org/)
- Window manager: [awesome](https://awesomewm.org/) ([Xorg](https://www.x.org/) as display server)
- Compositor: [picom](https://github.com/yshui/picom)
- Shell: [Zsh](https://www.zsh.org/) (with [Starship](https://starship.rs/) for my prompt)
- Application launcher: [Rofi](https://github.com/davatorium/rofi) (also using [emoji](https://github.com/Mange/rofi-emoji) and [calc](https://github.com/svenstaro/rofi-calc))
- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty) (switched from [Alacritty](https://alacritty.org))
- Text/code editor: [Neovim](https://neovim.io/) (using [kickstart](https://github.com/nvim-lua/kickstart.nvim))
- Audio:
  - Drivers and interface: [ALSA](https://www.alsa-project.org/)
  - Sound server: [PipeWire](https://pipewire.org/)
  - GUI apps:
    - [PulseAudio Volume Control](https://freedesktop.org/software/pulseaudio/pavucontrol/) for simple audio control
    - ~~[QjackCtl](https://qjackctl.sourceforge.io/) for advanced audio stuff~~
- Theming:
  - [Catpuccin](https://github.com/catppuccin/catppuccin) Mocha for my color scheme (I also use [Rigel](https://github.com/Rigellute/rigel) sometimes)
  - [LXAppearance](https://github.com/lxde/lxappearance) to configure my GTK theme
  - [Qt5ct](https://github.com/desktop-app/qt5ct) for apps that use QT toolkit (KDE apps)

## 🖥️ Desktop applications

<table>
  <tr>
    <td>🚨</td>
    <td>I try to limit myself to only use <a href="https://wikipedia.org/wiki/Free_and_open-source_software">FLOSS</a> software. If you are interested, I recommend you to check the following websites:
      <ul>
        <li><a href="https://www.privacytools.io/">Privacy Tools</a></li>
        <li><a href="https://www.privacyguides.org/">Privacy Guides</a></li>
        <li><a href="https://thenewoil.org/">The New Oil</a></li>
      </ul>
  </tr>
</table>

Anyway, here are the desktop apps I most commonly use:
- Browser: [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- Communication:
  - Messaging: [Signal](https://www.signal.org/)
  - Discord client: [Webcord](https://github.com/SpacingBat3/WebCord)
- File managers:
  - [yazi](https://github.com/sxyazi/yazi) (terminal-based, previously used [ranger](https://github.com/ranger/ranger))
  - [Dolphin](https://apps.kde.org/dolphin/)
  - [Nemo](https://github.com/linuxmint/nemo)
- Images
  - Drawing: [Krita](https://krita.org/)
  - Editing: [Gimp](https://www.gimp.org/)
  - Viewing: [nsxiv](https://github.com/nsxiv/nsxiv) (previously used [feh](https://feh.finalrewind.org/))
- Network:
  - Synchronization: [Syncthing](https://syncthing.net/)
  - VPN: [OpenVPN](https://openvpn.net/)
- Office:
  - [ONLYOFFICE](https://www.onlyoffice.com/) for my Office suite 
  - [Joplin](https://joplinapp.org/) for taking notes (uses Markdown, has Vim motions)
- Screenshots: [Flameshot](https://flameshot.org/)
- Torrent: [qBittorrent](https://www.qbittorrent.org/)
- Videos:
  - Editing: [Kdenlive](https://kdenlive.org/en/)
  - Viewing: [mpv](https://mpv.io/) and [vlc](https://www.videolan.org/vlc/)
  - YouTube client: [FreeTube](https://freetubeapp.io/)

## ✨ Inspiration

I did not make all of this myself. I am mainly tweaking existing configs from other people:
- [Phantas0s](https://github.com/Phantas0s/.dotfiles): Solid Zsh setup (without [omz](https://ohmyz.sh/)) and overall nice directory structure (Blog: [The Valuable Dev](https://thevaluable.dev/))
- [BrodieRobertson](https://github.com/BrodieRobertson/dotfiles): Automatic sourcing of aliases (Youtube: [Brodie Robertson](https://www.youtube.com/channel/UCld68syR8Wi-GY_n4CaoJGA))
- [Derek Taylor](https://gitlab.com/dwt1/dotfiles): Offers great advice on how to manage dotfiles (Youtube: [DistroTube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg))
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles): Tailored tmux/vim/fzf tools for a highly productive development workflow ([Twitch](https://www.twitch.tv/theprimeagen), [Youtube](https://www.youtube.com/channel/UC8ENHE5xdFSwx71u3fDH5Xw), [Youtube 2](https://www.youtube.com/channel/UCUyeluBRhGPCW4rPe_UvBZQ))
