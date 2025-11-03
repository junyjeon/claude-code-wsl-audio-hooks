# Contributing to Claude Code WSL Audio Hooks

First off, thank you for considering contributing to this project! 🎉

We welcome contributions from everyone. This document provides guidelines for contributing to make the process smooth and effective for all involved.

## 🤝 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the [existing issues](https://github.com/junyjeon/claude-code-wsl-audio-hooks/issues) to avoid duplicates.

**When submitting a bug report, include:**

- **Clear title**: Describe the issue concisely
- **Environment details**:
  - WSL version (`wsl --version`)
  - Windows version
  - PowerShell version
  - Claude Code version
- **Steps to reproduce**: Numbered steps that lead to the issue
- **Expected behavior**: What you expected to happen
- **Actual behavior**: What actually happened
- **Logs/errors**: Any error messages or console output
- **Configuration**: Relevant parts of your `settings.json`

**Example bug report:**

```markdown
### Bug: Sound plays twice on Edit

**Environment:**
- WSL 2 (Ubuntu 22.04)
- Windows 11 23H2
- PowerShell 7.3
- Claude Code 0.8.0

**Steps:**
1. Configure PreToolUse hook for Edit
2. Ask Claude to edit a file
3. Listen for audio

**Expected:** One sound plays
**Actual:** Two identical sounds play simultaneously

**Config:**
```json
{
  "hooks": {
    "PreToolUse": [...]
  }
}
```
```

### Suggesting Features

We're always interested in new ideas! Before suggesting:

1. **Check existing issues** for similar suggestions
2. **Explain the use case**: Why would this feature be useful?
3. **Describe the feature**: How should it work?
4. **Consider alternatives**: Are there other ways to achieve this?

**Example feature request:**

```markdown
### Feature: Volume control parameter

**Use Case:**
Some sounds are too loud for my environment. I'd like to adjust volume without editing the audio files.

**Proposed Solution:**
Add an optional volume parameter to play-mp3.ps1:

```powershell
play-mp3.ps1 'sounds\file.mp3' 50  # 50% volume
```

**Alternatives:**
- Edit audio files with Audacity
- Use Windows volume mixer (less convenient)
```

### Contributing Code

We follow a standard GitHub workflow:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Test thoroughly**: Ensure it works in WSL2
5. **Commit with clear messages**: `git commit -m "Add volume control to play-mp3.ps1"`
6. **Push to your fork**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

### Contributing Sound Packs

Have a great collection of sounds? Share it!

1. **Create a subdirectory** in `sounds/`:
   ```
   sounds/
   └── sound-packs/
       └── your-pack-name/
           ├── README.md
           ├── sound1.mp3
           └── sound2.mp3
   ```

2. **Document your pack** in the README.md:
   - Description of the theme
   - Source/attribution
   - License information
   - Example configuration

3. **Submit a PR** with your sound pack

### Improving Documentation

Documentation is crucial! Help us by:

- Fixing typos or unclear explanations
- Adding examples or use cases
- Translating documentation
- Improving troubleshooting guides

## 📝 Style Guidelines

### PowerShell Code

- Use clear, descriptive variable names
- Add comments for complex logic
- Handle errors gracefully
- Follow [PowerShell Best Practices](https://poshcode.gitbook.io/powershell-practice-and-style/)

**Example:**
```powershell
# Good
$audioFilePath = Join-Path $ScriptDir $RelativePath

# Less clear
$p = Join-Path $d $r
```

### JSON Configuration

- Use consistent indentation (2 spaces)
- Add comments explaining non-obvious settings
- Order sections logically

### Documentation

- Use clear, concise language
- Include examples where helpful
- Use emojis sparingly and appropriately
- Format code blocks with proper syntax highlighting

## 🔍 Code Review Process

All submissions require review. Here's what we look for:

1. **Functionality**: Does it work as intended?
2. **Compatibility**: Works on different WSL distributions?
3. **Code quality**: Readable and maintainable?
4. **Documentation**: Changes are documented?
5. **No breaking changes**: Unless absolutely necessary

## 🧪 Testing

Before submitting a PR, please test:

1. **Basic functionality**: Does audio play correctly?
2. **Error handling**: What happens if file doesn't exist?
3. **Edge cases**: Empty paths, special characters, etc.
4. **Different environments**: Test on fresh WSL install if possible

**Test checklist:**
- [ ] Audio plays successfully
- [ ] Errors are handled gracefully
- [ ] Works with different audio formats (MP3, WAV)
- [ ] Path resolution works correctly
- [ ] No breaking changes to existing configuration

## 📜 Commit Message Guidelines

Write clear, descriptive commit messages:

**Format:**
```
<type>: <short summary>

<optional longer description>

<optional footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

**Examples:**
```
feat: Add volume control parameter to play-mp3.ps1

Added optional volume parameter (0-100) to control playback volume.
Defaults to 100 (full volume) if not specified.

Closes #42
```

```
fix: Handle spaces in file paths correctly

File paths with spaces were not properly escaped in PowerShell.
Now using proper quoting to handle all special characters.
```

## 🎯 Pull Request Process

1. **Update documentation** if needed
2. **Add tests** for new functionality (if applicable)
3. **One feature per PR**: Keep PRs focused
4. **Link related issues**: Use "Fixes #123" or "Closes #456"
5. **Be responsive**: Address review feedback promptly

**PR Template:**
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Sound pack contribution

## Testing
- [ ] Tested on WSL2
- [ ] Audio plays correctly
- [ ] No errors in console

## Related Issues
Fixes #(issue number)

## Screenshots (if applicable)
```

## 💡 First-Time Contributors

New to open source? Welcome! Here are some good first issues:

- Documentation improvements
- Adding examples
- Fixing typos
- Adding sound packs
- Improving error messages

Look for issues labeled `good first issue` or `documentation`.

## 🌍 Community Guidelines

- **Be respectful**: Treat everyone with kindness
- **Be constructive**: Provide helpful feedback
- **Be patient**: Remember everyone is learning
- **Be inclusive**: Welcome contributors of all backgrounds

## ❓ Questions?

- **General questions**: [GitHub Discussions](https://github.com/junyjeon/claude-code-wsl-audio-hooks/discussions)
- **Bug reports**: [GitHub Issues](https://github.com/junyjeon/claude-code-wsl-audio-hooks/issues)
- **Security issues**: Email maintainers directly

## 📞 Contact

- GitHub Issues: For bug reports and feature requests
- GitHub Discussions: For questions and community chat
- Pull Requests: For code contributions

## 🙏 Recognition

Contributors will be:
- Listed in the README.md
- Mentioned in release notes
- Appreciated in the community!

---

Thank you for contributing! Every contribution, no matter how small, makes a difference. ❤️
