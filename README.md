# 🔊 Claude Code WSL Audio Hooks

> Bring sound notifications to Claude Code in WSL2 by bridging to Windows audio

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![WSL2](https://img.shields.io/badge/WSL2-Supported-blue.svg)](https://docs.microsoft.com/en-us/windows/wsl/)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

## 🎯 What is this?

WSL2 doesn't have native audio support, which means you miss out on helpful notification sounds when using Claude Code or Cursor in a Linux environment. This project solves that by creating a bridge from WSL to Windows audio system using PowerShell.

**Result:** You get satisfying audio feedback for your Claude Code interactions! 🎵

## ✨ Features

- 🔔 **Audio Notifications** - Hear when Claude starts/stops processing
- 🌉 **WSL → Windows Bridge** - Seamlessly plays audio through Windows
- ⚡ **Fast & Lightweight** - Minimal overhead, instant playback
- 🎨 **Customizable** - Use any MP3/WAV files you want
- 🔧 **Hook-Based** - Automatic triggers, no manual intervention
- 📦 **Easy Setup** - Simple configuration, works out of the box

## 🎬 How It Works

```
┌─────────────────────────────────────────────────────────────┐
│  WSL2 (Linux)                                               │
│                                                             │
│  ┌──────────────────────────────────────┐                  │
│  │  Claude Code detects event           │                  │
│  │  (Edit, UserPromptSubmit, Stop)      │                  │
│  └──────────────┬───────────────────────┘                  │
│                 │                                           │
│                 ▼                                           │
│  ┌──────────────────────────────────────┐                  │
│  │  Hook triggers PowerShell command    │                  │
│  └──────────────┬───────────────────────┘                  │
└─────────────────┼───────────────────────────────────────────┘
                  │
                  │ PowerShell Bridge
                  ▼
┌─────────────────────────────────────────────────────────────┐
│  Windows                                                    │
│                                                             │
│  ┌──────────────────────────────────────┐                  │
│  │  play-mp3.ps1 script                 │                  │
│  │  (Receives relative path)            │                  │
│  └──────────────┬───────────────────────┘                  │
│                 │                                           │
│                 ▼                                           │
│  ┌──────────────────────────────────────┐                  │
│  │  .NET MediaPlayer plays audio        │                  │
│  └──────────────────────────────────────┘                  │
│                                                             │
│  🔊 Sound plays through Windows audio!                      │
└─────────────────────────────────────────────────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- **WSL2** installed and running
- **Claude Code** or Cursor in WSL
- **PowerShell** (comes with Windows)

### Installation

1. **Clone this repository to your Claude config directory:**
   ```bash
   git clone https://github.com/junyjeon/claude-code-wsl-audio-hooks.git ~/.claude
   ```

2. **Or manually copy files if you already have a `.claude` directory:**
   ```bash
   # Copy the essential files
   cp play-mp3.ps1 ~/.claude/
   cp -r sounds/ ~/.claude/
   ```

3. **Merge the hook configuration into your settings:**

   Edit `~/.claude/settings.json` or create `~/.claude/settings.local.json` for project-specific config.

   See [example-settings.json](example-settings.json) for the complete configuration.

   ```json
   {
     "hooks": {
       "PreToolUse": [
         {
           "matcher": "Edit|Write|MultiEdit",
           "hooks": [
             {
               "type": "command",
               "command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\requestSent.mp3' 2>/dev/null || true"
             }
           ]
         }
       ],
       "UserPromptSubmit": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\responseReceived.mp3' 2>/dev/null || true"
             }
           ]
         }
       ],
       "Stop": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\done.mp3' 2>/dev/null || true"
             }
           ]
         }
       ]
     }
   }
   ```

4. **Test it out:**
   - Ask Claude to edit a file → 🔊 Hear `requestSent.mp3`
   - Submit a prompt → 🔊 Hear `responseReceived.mp3`
   - Stop Claude's processing → 🔊 Hear `done.mp3`

## 🎵 Available Hooks

| Hook Event | When It Triggers | Default Sound |
|------------|------------------|---------------|
| `PreToolUse` | Before Edit/Write/MultiEdit | `requestSent.mp3` |
| `UserPromptSubmit` | When you submit a prompt | `responseReceived.mp3` |
| `Stop` | When Claude stops processing | `done.mp3` |
| `PostToolUse` | After tool execution | (optional, configure your own) |

## 🎨 Customization

### Using Your Own Sounds

1. Place your audio files (MP3, WAV) in the `~/.claude/sounds/` directory
2. Update the hook commands in `settings.json` with your filenames:
   ```json
   "command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\your-sound.mp3' 2>/dev/null || true"
   ```

### Where to Find Sounds

- **Cursor/VSCode Built-in Sounds**:
  - Windows: `C:\Users\YourName\AppData\Local\Programs\cursor\resources\app\out\vs\platform\accessibilitySignal\browser\media\`
  - Copy any `.mp3` files from there
- **Free Sound Libraries**:
  - [Freesound.org](https://freesound.org/)
  - [Zapsplat.com](https://www.zapsplat.com/)
  - [Notification Sounds](https://notificationsounds.com/)
- **Create Your Own**: Use any audio editing software

See [sounds/README.md](sounds/README.md) for more details about the included sounds.

### Advanced Configuration

The PowerShell script (`play-mp3.ps1`) supports relative paths from the script location:

```powershell
# Organize sounds in subdirectories
powershell.exe -File ~/.claude/play-mp3.ps1 'sounds\notifications\mysound.mp3'
```

**Add more hooks for different events:**
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\command-complete.mp3' 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

## 🔧 Troubleshooting

### No Sound Playing

1. **Test PowerShell audio playback directly:**
   ```bash
   powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\requestSent.mp3'
   ```

2. **Verify file paths use Windows-style backslashes:**
   ```json
   "sounds\\requestSent.mp3"  ✅ Correct
   "sounds/requestSent.mp3"   ❌ Wrong (will fail on Windows)
   ```

3. **Check audio files exist:**
   ```bash
   ls ~/.claude/sounds/
   ```

4. **Ensure Windows audio is working:**
   - Verify system volume in Windows
   - Test with Windows Media Player or another app

### Permission Errors

The `-ExecutionPolicy Bypass` flag should handle execution policy issues, but if problems persist:

```powershell
# Run in Windows PowerShell (as Administrator):
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Hooks Not Triggering

1. **Verify hooks are in the correct settings file:**
   - Global: `~/.claude/settings.json`
   - Project-specific: `<project>/.claude/settings.local.json`

2. **Check Claude Code console for errors:**
   - Open developer console in Claude Code
   - Look for hook execution failures

3. **Validate JSON syntax:**
   - Use a JSON validator to check your settings file
   - Ensure proper comma placement and bracket matching

### Audio Cuts Off Early

If sounds are cut off, adjust the sleep duration in `play-mp3.ps1`:
```powershell
Start-Sleep -Seconds 2  # Increase this value for longer sounds
```

## 📁 Project Structure

```
~/.claude/
├── play-mp3.ps1              # PowerShell audio bridge script
├── sounds/                   # Audio files directory
│   ├── requestSent.mp3       # Played before edits
│   ├── responseReceived.mp3  # Played on prompt submit
│   ├── done.mp3              # Played when stopping
│   └── README.md             # Info about sound sources
├── settings.json             # Claude Code global settings
├── example-settings.json     # Template configuration
├── README.md                 # This file
├── LICENSE                   # MIT license
└── CONTRIBUTING.md           # Contribution guidelines
```

## 🤝 Contributing

Contributions are welcome! Here are some ways you can help:

- 🐛 Report bugs or issues
- 💡 Suggest new features or hook configurations
- 🎨 Share custom sound packs
- 📖 Improve documentation
- 🔧 Submit pull requests

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 📝 Technical Details

### How the PowerShell Bridge Works

The `play-mp3.ps1` script:
1. Receives a relative path to an audio file
2. Resolves it to an absolute path from the script's location
3. Uses .NET's `System.Windows.Media.MediaPlayer` class
4. Plays the audio through Windows audio system
5. Waits for playback to complete
6. Cleans up resources

### Why This Approach?

- **No additional dependencies**: Uses built-in Windows/.NET components
- **Fast execution**: Minimal overhead (~100-200ms)
- **Reliable**: Windows Media Player is stable and well-tested
- **Flexible**: Works with any audio format supported by Windows

## 📜 License

MIT License - see [LICENSE](LICENSE) file for details.

Free to use, modify, and distribute. Attribution appreciated but not required.

## 🌟 Acknowledgments

- Inspired by the need for better feedback in WSL environments
- Default sounds sourced from Cursor's built-in accessibility signals
- Built for the Claude Code and Cursor community

## 💬 Support & Community

- **Issues**: [GitHub Issues](https://github.com/junyjeon/claude-code-wsl-audio-hooks/issues)
- **Discussions**: [GitHub Discussions](https://github.com/junyjeon/claude-code-wsl-audio-hooks/discussions)
- **Pull Requests**: Always welcome!

---

**If this helps your workflow, please consider giving it a ⭐ star!**

Made with ❤️ for the WSL + Claude Code community
