# Terimal Commands

### Modify Dock Show/Hide Animation Speed
##### Completely Remove
```defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock```

##### Reduce Speed
```defaults write com.apple.dock autohide-time-modifier -float 0.25;killall Dock```


### Increase Key Repeat Rate


```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms) and 0 is 'blazingly fast'
```
[Source](https://gist.github.com/hofmannsven/ff21749b0e6afc50da458bebbd9989c5)

Revert to default settings (need to confirm).

```
defaults delete NSGlobalDomain KeyRepeat
defaults delete NSGlobalDomain InitialKeyRepeat
```
[Source](https://coderwall.com/p/jzuuzg/osx-set-fast-keyboard-repeat-rate)


### Always Show Hidden Files in Finder
```
defaults write com.apple.finder AppleShowAllFiles YES
```

##### Shortcut to Show/Hide Hidden Files
```
CMD + SHIFT + .
```

***

# Manual Steps
### Hide the Dock

```CMD + OPTION + D```


### Remove Adobe Creative Cloud on Login/Startup

```launchctl unload -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist```

[Source](https://apple.stackexchange.com/questions/138941/how-do-i-stop-the-adobe-creative-cloud-app-from-auto-launching-on-login)


### Disable CAPS LOCK
Under Keyboard -> Keyboard, click 'Modifier Keys', change the mapping for Caps Lock to No Action (or some other key).
