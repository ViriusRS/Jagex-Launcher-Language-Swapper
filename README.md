# Jagex-Launcher-Language-Swapper
A simple overlay to quickly change game language when using the Jagex Launcher for RuneScape 3

![Demo](https://github.com/ViriusRS/Jagex-Launcher-Language-Swapper/assets/118407191/027d5740-d97e-4f65-9ede-5ce9c526856c)

**Setup:**

  • AutoHotKey is required to run this script. Download it at https://autohotkey.com

  • If you get the `Failed to load the required files` error when launching the script, double check the following:
  1. `RS3LangSwap.png` is in the same directory as the script
  2. The file path of your `Cache Folder` is set correctly
      1. Go to change language like normal and copy the contents of the `Cache Folder` box
      2. Open the script in a text editor and replace the value of the `cacheFolder` variable at the top

**Recommendations:**

  • Set the script to run automatically on start-up
  1. `Windows+R` to open Run
  2. Type `shell:startup` and hit enter
  3. Place the script (or a shortcut to the script) inside the folder that opened
    
  • Uncomment `#NoTrayIcon` to make the script run silently without a system tray icon

  • Customise the position and opacity of the overlay to suit your preferences

![Config](https://github.com/ViriusRS/Jagex-Launcher-Language-Swapper/assets/118407191/0cf13b19-3784-43a7-976d-b8ee129a25f2)

  **Save and reload the script after making changes**

If you're still encountering problems, open an issue here or reach out to me directly
