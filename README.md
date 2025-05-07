# toggle-pw-volumes

**toggle-pw-volumes** is a simple tool for cycling through all active [PipeWire](https://pipewire.org/) media sessions and toggling mute/unmute, so that only one client/player is audible at any given time. The other clients continue playing, but their audio is muted. This is especially useful when watching or listening to multiple streams, podcasts, music, or live TV channels-making it easy to focus on one source without pausing the others.

---

## Features

- **Cycle through active PipeWire audio sessions** (e.g., VLC, MPV, FFPLAY, etc.)
- **Mute/unmute** so only one media client is audible at a time
- **Non-intrusive**: muted clients keep playing in the background
- **Perfect for multi-stream watching/listening** (e.g., following several live TV channels during news hour)

---

## Usage

1. **Run the script as the user who owns the media applications.**  
   > PipeWire must be running under your user session.

2. **Cycle through sessions:**  
   Each time you run the script, it will unmute the next active media session and mute the rest.

3. **(Optional) Assign a keyboard shortcut:**  
   For quick toggling, you can assign a custom shortcut in GNOME:
   - Go to **Settings** → **Keyboard** → **View and Customize Shortcuts**
   - Add a new custom shortcut pointing to the script

---

## Installation

1. Clone this repository:
