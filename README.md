# 🧠 Linux Smart Workstation Manager

A terminal-based intelligent productivity assistant for Linux using pure Bash scripting.

## 🚀 Features

- 🔄 Auto-setup workspaces (Coding, Browsing, Research)
- 📊 Session logging & productivity dashboard
- 🔔 Time-based reminders and break alerts
- 🌗 Theme switching (Dark/Light) based on time
- 🧠 (Optional) Voice input mode using `espeak` and `arecord`
- 📈 Usage stats via ASCII dashboard

## 🛠 Requirements

- Bash 4+
- Linux OS
- Tools:
  - `wmctrl`, `xdotool`, `notify-send`
  - `espeak` (optional voice)
  - `gnuplot` (for ASCII graphs)
  - `cron` (for break reminders)

## 📦 Installation

```bash
git clone https://github.com/yourusername/smart-workstation-manager.git
cd smart-workstation-manager
chmod +x install.sh
./install.sh
```



## Configuration

1. **Customizing Modes** : Each mode script is located in the `modes/` folder. You can modify these scripts to better fit your workflow.
2. **Config File** : The main configuration file is `config/smartwmrc`. You can modify:

* Default editor (e.g., `code`, `vim`, `nano`)
* Default browser (e.g., `firefox`, `chrome`)
* PDF viewer (e.g., `evince`)
* Other preferences such as project directories, etc.

1. **Usage Stats** : The usage stats are logged in `logs/usage_stats.log`. You can review your productivity in the `stats.sh` script or manually check the log.

## Usage

SmartWM supports the following modes:

* **Coding** : Sets up your editor and workspace for coding.
* **Browsing** : Opens research and work-related websites in your browser.
* **Research** : Opens your research folder, websites, and academic PDFs.

To launch a mode, run:

```bash
smartwm <mode_name>
```

Where `<mode_name>` can be `coding`, `browsing`, or `research`.

Additionally, you can restore your last used mode:

```bash
smartwm restore
```

### Voice Command Mode

To launch SmartWM with voice commands, use:

```bash
smartwm voice
```

This will listen for commands like "coding", "browsing", and "research" to trigger the respective modes.

### Break Reminder

To enable periodic break reminders (e.g., every 45 minutes), run:

```bash
smartwm break
```

## License

This project is licensed under the MIT License - see the [LICENSE](https://chatgpt.com/c/LICENSE) file for details.
