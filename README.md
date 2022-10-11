# Tic-Tac-Toe in Flutter

## Flutter: Let's Go 🏁

### On Local Machine

+ [Setup Flutter SDK](https://docs.flutter.dev/get-started/install)
+ [Setup Editor](https://docs.flutter.dev/development/tools)
+ [Create Project on Visual Studio Code](https://docs.flutter.dev/development/tools/vs-code#creating-a-new-project)
+ Upload Code from Local VS Code directory to GitHub

### On GitHub Codespaces

+ Open repo on GitHub Codespaces
+ create a folder ```.devcontainer``` and a file ```devcontainer.json``` in it with following image code

```powershell
{
    "image": "cirrusci/flutter:beta",
    "forwardPorts": [
        3000
    ]
}
```

+ Rebuild container
+ Run ```Flutter Doctor```
+ Let's Code >> Flutter
+ To serve app on web server ```flutter run --release -d web-server --web-hostname=0.0.0.0 --web-port=3000```



### Via Official Initial Flutter Build

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
