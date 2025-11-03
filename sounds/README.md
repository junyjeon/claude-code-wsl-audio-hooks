# 🎵 Audio Files

This directory contains the default notification sounds for Claude Code WSL Audio Hooks.

## Included Sounds

### `requestSent.mp3`
- **Triggers on**: PreToolUse (Edit, Write, MultiEdit)
- **Description**: Plays before Claude starts editing files
- **Duration**: ~0.5 seconds
- **Source**: Cursor's built-in accessibility signal

### `responseReceived.mp3`
- **Triggers on**: UserPromptSubmit
- **Description**: Plays when you submit a prompt to Claude
- **Duration**: ~0.8 seconds
- **Source**: Cursor's built-in accessibility signal

### `done.mp3`
- **Triggers on**: Stop
- **Description**: Plays when Claude stops processing
- **Duration**: ~0.4 seconds
- **Source**: Cursor's built-in accessibility signal

## Sound Sources

The default sounds included in this repository are sourced from Cursor's built-in accessibility signals, located at:

```
C:\Users\YourName\AppData\Local\Programs\cursor\resources\app\out\vs\platform\accessibilitySignal\browser\media\
```

These sounds are part of VSCode/Cursor's accessibility features designed to provide audio feedback for various editor events.

## Adding Your Own Sounds

### 1. Find or Create Sounds

**Free Sound Resources:**
- [Freesound.org](https://freesound.org/) - Creative Commons licensed sounds
- [Zapsplat.com](https://www.zapsplat.com/) - Free sound effects
- [Notification Sounds](https://notificationsounds.com/) - UI notification sounds
- [Mixkit](https://mixkit.co/free-sound-effects/) - Free sound effects

**From Your System:**
- **Windows Sounds**: `C:\Windows\Media\`
- **Cursor/VSCode**: `C:\Users\YourName\AppData\Local\Programs\cursor\resources\app\out\vs\platform\accessibilitySignal\browser\media\`
- **Slack**: Often has nice notification sounds in its installation directory

### 2. Audio Format Requirements

**Supported Formats:**
- MP3 (recommended)
- WAV
- WMA
- Any format supported by Windows Media Player

**Recommendations:**
- Keep files small (<100KB) for fast loading
- Use short sounds (0.2-1.0 seconds)
- Avoid loud or jarring sounds
- Test volume levels

### 3. Add to This Directory

```bash
# Copy your audio file
cp /path/to/your/sound.mp3 ~/.claude/sounds/

# Update your settings.json
# Change the command to reference your new sound:
"command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\your-sound.mp3' 2>/dev/null || true"
```

### 4. Organize with Subdirectories

You can organize sounds into categories:

```
sounds/
├── notifications/
│   ├── success.mp3
│   ├── error.mp3
│   └── warning.mp3
├── actions/
│   ├── start.mp3
│   └── complete.mp3
└── custom/
    └── mysound.mp3
```

Update your hooks to use the subdirectory path:
```json
"command": "powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\notifications\\success.mp3' 2>/dev/null || true"
```

## Sound Customization Ideas

### By Event Type

**PreToolUse (before editing):**
- Subtle "whoosh" or "click"
- Keyboard typing sound
- Soft chime

**UserPromptSubmit (prompt sent):**
- "Send" swoosh
- Message sent tone
- Gentle ping

**Stop (processing stopped):**
- Completion chime
- Success tone
- Satisfying "done" sound

**PostToolUse (after tool execution):**
- Success chime
- Completion beep
- Achievement unlock sound

### By Context

**Development:**
- Mechanical keyboard sounds
- Terminal beeps
- Retro computer sounds

**Professional:**
- Subtle notification tones
- Minimalist clicks
- Office-appropriate sounds

**Fun:**
- Game sound effects
- Sci-fi sounds
- Musical notes

## Creating Your Own Sounds

### Audio Editing Tools

**Free:**
- [Audacity](https://www.audacityteam.org/) - Full-featured audio editor
- [Ocenaudio](https://www.ocenaudio.com/) - Easy-to-use audio editor
- [WavePad](https://www.nch.com.au/wavepad/) - Audio editing software

**Online:**
- [TwistedWave Online](https://twistedwave.com/online) - Browser-based editor
- [Audiotool](https://www.audiotool.com/) - Online music production

### Tips for Making Good Notification Sounds

1. **Keep it short**: 0.2-1.0 seconds is ideal
2. **Not too loud**: Should be noticeable but not jarring
3. **Clear tone**: Distinct from other system sounds
4. **Pleasant**: You'll hear it many times, make it enjoyable
5. **Test it**: Play it multiple times to ensure it's not annoying

### Example: Creating a Simple Chime

1. Open Audacity
2. Generate → Tone
3. Frequency: 800-1200 Hz
4. Duration: 0.3 seconds
5. Waveform: Sine
6. Add fade out effect
7. Export as MP3

## Troubleshooting

### Sound Not Playing

1. **Check file path:**
   ```bash
   ls ~/.claude/sounds/your-sound.mp3
   ```

2. **Test manually:**
   ```bash
   powershell.exe -ExecutionPolicy Bypass -File ~/.claude/play-mp3.ps1 'sounds\\your-sound.mp3'
   ```

3. **Verify Windows can play it:**
   - Open file in Windows Media Player
   - Check codec compatibility

### Sound Cuts Off

If your sound is cut off early, increase the sleep duration in `play-mp3.ps1`:

```powershell
Start-Sleep -Seconds 2  # Increase this for longer sounds
```

## Contributing Sound Packs

If you create an interesting sound pack, consider sharing it:

1. Create a subdirectory with your sounds
2. Add a description of your pack
3. Submit a pull request to the repository
4. Include any licensing information

## License Note

The default sounds included are from Cursor/VSCode, which are released under MIT license. When adding your own sounds, ensure you have the rights to use and distribute them.

---

**Happy sound designing!** 🎨🔊
