# Bible Explorer

A mobile-first Bible exploration game where a clumsy astronaut from year 20XX returns to post-humanity Earth to research and revive the lost Christian religion.

## Quick Start

No build step needed. Open any HTML file in a browser:

```bash
# Main game hub
open src/spaceship-hub.html

# Bible reading + devotion
open src/devotion-screen.html

# Exploration scene (Tower of Babel)
open src/babel-landing.html
```

## Project Structure

```
bible-explorer/
├── docs/
│   ├── HANDOFF.md              # Full project context for AI handoffs
│   ├── project-brief.md        # Original project brief
│   └── SCENE-GUIDE.md          # Location lore + art direction (TBD)
├── src/
│   ├── spaceship-hub.html      # Main hub — walk-around spaceship interior
│   ├── devotion-screen.html    # Bible reading + devotion flow
│   ├── babel-landing.html      # Exploration scene — Tower of Babel
│   └── game-state.js           # Shared state module (TBD)
├── content/
│   ├── genesis-devotions.json  # 50-chapter devotion content
│   ├── genesis-chapters.json   # Full Bible text (TBD)
│   └── scene-illustrations/    # SVG backgrounds per chapter (TBD)
├── TASK-BOARD.md               # Who's doing what — check before starting
└── README.md
```

## Tech Stack

- **Rendering:** HTML5 Canvas, pixel art (192x108), nearest-neighbor scaling
- **Audio:** WebAudio API — procedural chiptune (no audio files)
- **Fonts:** Pixelify Sans, Atkinson Hyperlegible, Spectral, Lora
- **Bible:** World English Bible (public domain)
- **Mobile:** Capacitor (Android)

## Contributing (AI Workflow)

This project is built by three AIs:

| AI | Role |
|----|------|
| Claude | Pixel art, animations, audio, scene building |
| Codex/GPT | Engineering, state, navigation, builds |
| Gemini | Bible content, illustrations, lore writing |

1. Read `docs/HANDOFF.md` for full context
2. Check `TASK-BOARD.md` for your assigned tasks
3. Update the task board when done

## License

Game code: MIT
Bible text: World English Bible (public domain)
