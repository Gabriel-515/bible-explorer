# Bible Explorer — Task Board

> Last updated: 2026-10-20
> Status: Genesis Beta — Pre-Alpha
> Codex: Milestone 1 engineering complete

---

## How This Works

Three AIs collaborate on this project. Each has a role:

| AI | Role | Best At |
|----|------|---------|
| **Claude** | Art Director & Scene Builder | Pixel art, animations, procedural audio, visual effects, UX design |
| **Codex/GPT** | Lead Engineer | State management, navigation, wiring, build system, refactoring |
| **Gemini** | Content Producer | Bible text, devotion content, SVG illustrations, lore writing, research |

**Rules:**
1. Always pull latest before starting work
2. Update this file when you start/finish a task
3. Put source code in `src/`, content in `content/`, docs in `docs/`
4. Each AI reads `docs/HANDOFF.md` for full context before starting

---

## Milestone 1: Foundation (Current)

### Codex — Engineering
- [x] Create `src/game-state.js` — shared localStorage state module
  - Keys: readingStyle, currentSkin, gold, chaptersRead, currentChapter, bookmarks
  - try/catch wrapper for localStorage
- [x] Add Style B (Futuristic) reading mode to `src/devotion-screen.html`
  - Dark bg, Lora font, cyan accents, scanline effects
  - Toggle button in header to switch B ↔ C
  - Persist choice via game-state
- [x] Wire hub → devotion screen navigation
  - Bible Reader station opens devotion-screen.html
  - "Back to Ship" button returns to hub
  - Pass chapter number via URL param or state
- [x] Persist wardrobe skin choice across page loads
- [x] Fix "Episode 1" label on babel-landing → "Scene 5 · Plain of Shinar"
- [x] Add Lora font to all HTML files

### Gemini — Content
- [ ] Generate `content/genesis-chapters.json` — all 50 Genesis chapters
  - Format: `[{"chapter":1,"verses":[{"number":1,"text":"..."},...]},...]`
  - Source: World English Bible (public domain)
- [ ] Generate `content/svg-descriptions.json` — illustration guide for each chapter
  - Format: `[{"chapter":1,"title":"Creation","elements":["stars","plants","light rays"],"mood":"awe"},...]`
- [ ] Write scene lore for all 11 locations → `docs/SCENE-GUIDE.md`
  - Historical context, geography, atmosphere description
  - What the astronaut discovers at each location
  - Key visual elements for pixel art scenes
- [ ] Generate 50 SVG background illustrations → `content/scene-illustrations/`
  - Faded botanical/contextual style matching Style C reading area
  - Named `chapter-01.svg` through `chapter-50.svg`

### Claude — Visual (on standby)
- [ ] Garden of Eden exploration scene (Scene 1)
- [ ] Mount Ararat / Noah's Ark scene (Scene 4)
- [ ] Procedural ambient music per scene type
- [ ] Additional astronaut poses if needed

---

## Milestone 2: Playable Loop

- [ ] Chapter gating — lock Command Center destinations behind chapter completion
- [ ] Full reading flow — load any chapter from genesis-chapters.json
- [ ] Gold rewards — quiz completion awards gold
- [ ] Scene transitions — hub → reading → exploration → back to hub
- [ ] 3+ exploration scenes playable
- [ ] Basic save/load on app restart

---

## Milestone 3: Polish & Ship

- [ ] All 11 exploration scenes
- [ ] Tutorial / onboarding flow
- [ ] Journal / Collections UI
- [ ] Sound settings (music vs SFX volume)
- [ ] Capacitor Android build
- [ ] Play Store listing assets
- [ ] Beta testing

---

## Completed
- [x] Milestone 1 engineering foundation — shared state, dual reader styles, page navigation, and skin persistence (Codex)
- [x] Spaceship hub with 5 stations + wardrobe (Claude)
- [x] Tower of Babel exploration scene with full story (Claude)
- [x] Devotion reading screen — Style C (Claude)
- [x] 3 astronaut skins — Archivist, Nomad, Beacon (Claude)
- [x] 50-chapter devotion JSON (Gemini)
- [x] Reading UI style comparison — chose B + C (Claude)
- [x] Game Design Document (Claude)
- [x] Handoff document (Claude)
