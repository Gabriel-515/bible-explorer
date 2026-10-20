# Bible Explorer — Development Handoff Document

## Project Overview

**Bible Explorer** is a mobile-first Bible exploration game where ARCHIVIST-07, a curious and clumsy junior botanical archivist, returns to post-humanity Earth on an official recovery expedition after discovering a fragment of the Bible his civilization cannot explain. His private investigation asks what humanity forgot about love, faith, and meaning while recovered Biblical history is transmitted back into the human archive. The game gates exploration progress behind Bible reading — players must complete required chapters before unlocking the next locations.

**Genre:** Educational adventure / Bible devotion game
**Platform:** Android first (via Capacitor), web-compatible
**Episode:** Genesis Beta — 11 locations, 50 chapters, English only, free to play
**Bible Translation:** World English Bible (WEB) — public domain

### Canonical Narrative Foundation

See [`docs/NARRATIVE-FOUNDATION.md`](NARRATIVE-FOUNDATION.md) before writing intro cinematics, protagonist dialogue, Earth-mission lore, or long-term character development. It locks ARCHIVIST-07's motivation, the agape anomaly, the official Earth recovery mission, the transmitter's narrative purpose, and the rule that the central conflict is **calculation vs meaning**, not technology vs Christianity.

---

## Game Architecture

### Tech Stack
- **Rendering:** HTML5 Canvas, pixel art at 192×108 logical resolution (128×72 for some scenes), 16:9 aspect ratio
- **Scaling:** `image-rendering: pixelated / crisp-edges` for retro look
- **Audio:** WebAudio API — procedural chiptune music and SFX (no audio files)
- **State Machine:** Async promise-driven story system with `runId` abort guards
- **Mobile Wrapping:** Capacitor for Android APK
- **Fonts:** Pixelify Sans (pixel headings), Atkinson Hyperlegible (body/UI), Spectral (verses in Hybrid reading style), Lora (verses in Futuristic reading style — chosen for comfort + old script hint)

### Color Tokens
```
--night:    #0a0a1a    (deep background)
--holo:     #6ff7ff    (cyan hologram/UI accent)
--sand:     #f3a35c    (warm orange/gold accent)
--warm-white: #ffe8c0  (warm text)
--panel:    #151a38    (UI panel bg)
--line:     #2c3260    (borders)
--muted:    #a8a4c6    (secondary text)
```

### Pixel Art Sprite System
Characters are defined as arrays of strings with single-char color codes mapped through a palette object (`PAL`). The `sprite()` function renders them pixel-by-pixel with a 1px dark outline.

Example:
```javascript
const PAL = { w:'#eef3f6', g:'#9aa6b2', v:'#2aa3d6', V:'#b8f0ff', o:'#f08a3a', d:'#3a3f4a' };
const BODY = [
  "...wwww...",
  "..wwwwww..",
  ".gwwvvvw.",
  ".gwwvVvvw.",
  // etc
];
```

---

## Astronaut Skins (3 available in beta)

### Skin 0: The Archivist (Classic White Suit)
- Clean white spacesuit with cyan visor
- Scanner device on arm
- Hologram scan cone effect
- Colors: white body (#eef3f6), grey details (#9aa6b2), cyan visor (#2aa3d6)

### Skin 1: The Nomad (Desert Wanderer)
- Dark helmet with cyan slit visor
- Sandy desert cloak over suit
- Staff scanner with glowing core
- Colors: dark helmet (#333a3d), cloak (#9c7359/#a87c63), cyan visor (#00e5ff)

### Skin 2: The Beacon (Retro-Heavy)
- Bulky cream-colored mech suit
- Industrial orange accent stripes
- CRT monitor helmet with green pixel eyes
- Shoulder radar dish
- Colors: cream body (#e2dacd), orange stripes (#d86a48), green eyes (#00ff41)

### Sprite Poses Available
- `BODY` — standing torso+head
- `LEGS0` — standing legs
- `LEGS1` — walk frame 1 (legs apart)
- `LEGS2` — walk frame 2 (legs together)
- `SIT` — sitting pose
- `REACH` — arm extended (relic pickup)
- `FALLEN` — tripped/fallen
- `SHOCKED` — surprised reaction
- `CHEER` — arms up celebrating
- `LEGS_APART` — wide stance

Each skin has its own `body`, `legs0/1/2`, and `sit` sprite arrays with its own palette.

---

## Game Scenes & Files

### 1. Spaceship Hub (`spaceship-hub.html`)
**Published artifact:** https://claude.ai/artifact/XDFLzYXx6q7h6BELbV9fJ5

The main home screen — Pokemon/Harvest Moon style interior. Side-view pixel art spaceship interior where the astronaut walks around freely by tap-to-move.

**Interactive Stations:**
| Station | Location | Function |
|---------|----------|----------|
| Bible Reader | Left (desk with laptop) | Opens Bible reading + devotion flow |
| Command Center | Right (big monitor + console) | Shows next mission, launches exploration scenes |
| Journal/Collections | Center-left (bookshelf) | View collected relics and findings |
| Wardrobe | Center (double-door cabinet) | Switch between 3 astronaut skins |
| Sleep Pod | Far left (bed) | Save game / rest / advance day |

**Background elements:** Viewport window showing Earth + stars, ceiling lights, wall pipes/cables, blinking status lights, warm desk lamp glow, hologram cube on shelf.

**Canvas:** 192×108 logical pixels, nearest-neighbor scaled.

### 2. Tower of Babel — Scene 5 (`babel-landing.html`)
**Published artifact:** https://claude.ai/artifact/1XiFj9gukmgPXzmEjtUaah

The first exploration prototype, representing Scene 5 at the Plain of Shinar. Desert landscape with ancient tower ruins. Full story sequence with:
- Landing animation (rocket flies in, astronaut tumbles out)
- Exploration (walking, scanning ruins)
- Relic discovery (ancient tablet)
- Data transmitter device (draws beam upward)
- Laser beam finale with astronaut reaction animations (shocked → cheering)
- Procedural chiptune music and SFX

**Canvas:** 192×108 logical pixels.

**Story flow:** Landing → walk and explore → scan ruins → discover relic → walk to transmitter → fire laser → shocked reaction → cheer → completion.

### 3. Devotion Reading Screen (`devotion-screen.html`)
**Published artifact:** https://claude.ai/artifact/XUo6UNHFz3xBs29nbKVwXB

Full interactive Bible reading + devotion experience. 6 phases:
1. **Boot** — Laptop boot animation
2. **Reading** — Bible text with pagination (6 verses/page)
3. **Reflection** — Devotion reflection + prayer
4. **Quiz** — Multiple choice question with gold rewards (+30 correct, +10 trying)
5. **Transmitter** — Data transmit animation
6. **Laser Finale** — Beam effect (may be deprecated; user wants laser in main scene instead)

**Current UI:** Style C (Hybrid) — futuristic chrome frame + warm cream (#faf3e8) reading area with Spectral serif font, faded SVG botanical background illustration.

**Contains:** Full Genesis 1 text (31 verses, WEB public domain), paginated. Font size toggle, bookmark button.

---

## Bible Reading UI — Dual Style System

Players choose their preferred reading style in settings/wardrobe:

### Style B: Futuristic Tablet
- Dark background (#0c1828)
- Holographic scanline effects
- Font: **Lora** (comfortable with old-script hint)
- Color: light blue-grey text (#c8d8e8) on dark
- Cyan verse numbers, glowing accents
- Horizontal scanline dividers
- Best for: immersive sci-fi feel

### Style C: Hybrid (Warm Reading)
- Futuristic chrome frame with warm cream reading area (#faf3e8)
- Font: **Spectral** (serif)
- Color: dark brown text (#2a2016) on cream
- Faded SVG botanical background illustrations
- Gold verse numbers (#b08a50)
- Best for: long comfortable reading sessions

Both share the same:
- Pixelify Sans for headers/UI
- Pagination at 6 verses per page
- Navigation buttons, progress indicators
- Font size toggle
- Bookmark functionality

---

## Devotion Content (`genesis-devotions.json`)

50-chapter devotion data array. Each entry:
```json
{
  "chapter": 1,
  "title": "The Beginning of Everything",
  "reflection": "...",
  "prayer": "...",
  "question": "According to Genesis 1, what did God create first?",
  "options": ["Light", "Water", "Animals", "Plants"],
  "answer": 0
}
```

Generated for all 50 Genesis chapters. Powers the reflection, prayer, and quiz phases of the devotion flow.

---

## Game Design Document
**Published as Claude Doc:** https://claude.ai/artifact/Wh9g3x5zH7KB9KhArwmbKu

8 sections covering full game design including:
- Game concept & story
- Episode structure (Genesis beta)
- Character design
- Bible reading integration
- Reward system (gold, relics)
- Scene progression
- Technical architecture
- Art style guide

---

## Reading UI Style Mockups
**Published artifact:** https://claude.ai/artifact/1vjYybsWRfq925pXprHY3S

Side-by-side comparison of all three reading styles (A: Ancient Scroll, B: Futuristic, C: Hybrid). Style A was rejected. B and C are both kept for player choice.

---

## Gold & Reward System

- Quiz correct answer: **+30 gold**
- Quiz attempt (wrong): **+10 gold**
- Completing a chapter reading: gold reward TBD
- Discovering relics: gold reward TBD
- Gold displayed in ship hub status bar

---

## Episode 1: Genesis — Scene Progression

11 locations mapped to 50 Genesis chapters:

| # | Location | Chapters | Key Events |
|---|----------|----------|------------|
| 1 | Garden of Eden | 1-3 | Creation, Fall |
| 2 | East of Eden | 4 | Cain & Abel |
| 3 | Ancient World | 5 | Genealogies |
| 4 | Mount Ararat | 6-9 | Noah's Ark, Flood |
| 5 | Plain of Shinar | 10-11 | Tower of Babel |
| 6 | Land of Canaan | 12-14 | Abraham's Call |
| 7 | Oaks of Mamre | 15-20 | Covenant, Sodom |
| 8 | Mount Moriah | 21-25 | Isaac, Abraham's Test |
| 9 | Beer-lahai-roi | 26-28 | Jacob & Esau |
| 10 | Paddan-aram | 29-36 | Jacob's Journeys |
| 11 | Egypt | 37-50 | Joseph's Story |

**Gating:** Players must complete required Bible chapters before the next location unlocks at the Command Center.

---

## What's Built vs What's Needed

### Built (Prototype/Working)
- [x] Spaceship hub with walk-around, 5 interactive stations, wardrobe with 3 skins
- [x] Tower of Babel exploration scene (full story sequence with transmitter + laser)
- [x] Devotion reading screen (Styles B/C with full Genesis 1 text, quiz, reflection)
- [x] Shared local game state for reading style, skin, gold, chapter progress, and bookmarks
- [x] Hub → Bible Reader navigation and Back to Ship flow
- [x] Reading UI mockups (3 styles compared, B and C selected)
- [x] 50-chapter devotion content JSON
- [x] Game Design Document
- [x] Pixel art sprite system with 3 astronaut skins
- [x] Procedural audio system (chiptune music + SFX)

### Needed (Next Steps)
- [ ] **Garden of Eden scene** (Scene 1) — first exploration location
- [ ] **Mount Ararat scene** (Scene 2) — Noah's Ark location
- [ ] **Remaining 8 exploration scenes** for Genesis episode
- [ ] **Refactor to data-driven template** — babel-landing.html → reusable scene engine with JSON scene data
- [ ] **Complete hub → exploration flow** — Command Center launches missions with chapter gating
- [ ] **Full 50-chapter Bible text** — load all Genesis chapters (currently only Ch 1 is embedded)
- [ ] **Expand save system** — current localStorage state works; add mission unlocks and any future backend sync
- [ ] **Capacitor Android build** — wrap web app into APK
- [ ] **Background music** — procedural ambient tracks per scene
- [ ] **Tutorial/onboarding** — first-time player guidance
- [ ] **Collections/Journal UI** — display found relics and completed chapters

---

## File Inventory

| File | Description | Size |
|------|-------------|------|
| `spaceship-hub.html` | Main hub scene — walk-around spaceship interior | ~16KB |
| `babel-landing.html` | Genesis Scene 5 exploration scene — Tower of Babel | ~25KB |
| `devotion-screen.html` | Bible reading + devotion flow (Styles B/C) | ~30KB |
| `game-state.js` | Shared localStorage state with in-memory fallback | ~3KB |
| `genesis-devotions.json` | 50-chapter devotion content | ~15KB |
| `project-brief.md` | Project brief document | ~5KB |
| `reading-mockups.html` | 3 reading style comparison mockups | ~12KB |

All files are self-contained HTML with inline CSS/JS. No build step required. Open in any browser.

---

## Key Design Decisions Made

1. **Reading style:** Both Style B (Futuristic) and Style C (Hybrid warm) kept — player chooses
2. **Font for Style B:** Lora — comfortable screen reading with old-script character
3. **Font for Style C:** Spectral — classic serif for warm reading
4. **Laser beam:** Fires from main game scene (not separate UI) with astronaut reactions
5. **Hub design:** Pokemon/Harvest Moon-style cozy spaceship interior, tap-to-walk
6. **Bible reading placement:** Accessed from ship's Bible Reader station
7. **3 astronaut skins:** Archivist (white), Nomad (desert), Beacon (retro) — wardrobe in ship
8. **Canvas resolution:** 192×108 standard (some scenes 128×72)
9. **Bible translation:** World English Bible (public domain)
10. **Gating system:** Must read required chapters before unlocking next exploration location

---

## How to Continue Development

1. **To add a new exploration scene:** Clone `babel-landing.html`, modify the `paintScene()` background function, update `story()` sequence, change the chapter requirements
2. **To extend reading styles:** Reuse the existing `.style-futuristic` / `.style-hybrid` class toggle in `devotion-screen.html`
3. **To wire more hub stations:** Replace each remaining placeholder station action with page navigation; Bible Reader is already connected
4. **To add a new skin:** Add an entry to the `SKINS` array with `name`, `desc`, `pal` (palette object), `body`, `legs0/1/2`, `sit` sprite arrays
5. **To build for Android:** Install Capacitor, create project, copy HTML files to www/, run `npx cap sync android && npx cap open android`

---

*Generated from Claude × Bible Explorer development session*
*All prototypes are live at the artifact URLs above*
