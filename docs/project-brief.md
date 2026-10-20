# Project Brief: Bible Explorer (Working Title)

## Concept
A mobile game where you play a clumsy astronaut from the year 20XX who lands on a post-humanity Earth. You explore biblical locations in the order they appear in Scripture — tapping relics, scanning ruins, and watching holograms bring ancient stories to life. Think: cozy exploration + Bible discovery + retro pixel charm.

## Current State
- **Prototype built:** Episode 1 (Tower of Babel) is a fully playable HTML5 scene with pixel art, chiptune music, and a JRPG-style dialog system.
- **Flow per location:** Rocket lands → astronaut tumbles out → tap ship (scan location info) → walk to relic → tap hand (hologram appears) → journal cards unlock with verses (World English Bible, public domain).
- **Tech:** Canvas pixel art (128px wide, scaled up), WebAudio chiptune, async state machine. Target: wrap with Capacitor for Android/iOS.
- **Art style:** Retro pixel art, dark palette with cyan hologram glow (#6ff7ff) and warm sand tones (#f3a35c). The astronaut is clumsy and endearing.

## Episode Plan (Genesis)
1. ~~Tower of Babel~~ (done — Plain of Shinar, Genesis 11)
2. Noah's Ark (Mount Ararat — starry frozen night, aurora, animals)
3. Garden of Eden (lush, golden light, the Tree)
4. Cain & Abel's Field
5. Ur of the Chaldees (Abraham's origin)

## Bible Approach
- World English Bible (free, public domain)
- No guilt mechanics — missed days are forgiven
- Rewards: reading verses, fill-in-the-blank puzzles, character quizzes
- Gold earned → upgrades and Bible collectibles

## What's Needed Next
- [ ] Turn the Babel prototype into a reusable template (scene data drives each episode)
- [ ] Build Episode 2: Ararat
- [ ] Concept art for each location (style reference: the prototype's pixel art)
- [ ] Trailer / teaser video
- [ ] Code review of the prototype
- [ ] Plan the Capacitor mobile build

## Technical Details
- Single HTML file per episode (canvas + WebAudio, no frameworks)
- Fonts: Pixelify Sans (pixel headings), Atkinson Hyperlegible (body), Spectral (verses)
- Canvas: 128px logical width, 16:9 ratio, scaled to fill screen
- Hologram: built tier-by-tier with chime sounds, cyan glow
- All audio is procedurally generated (no asset files needed)

## Team Roles
- **Project lead / player:** [You]
- **Claude:** Architecture, code, content writing, prototypes, design decisions
- **Gemini:** Concept art (Imagen), video trailers (Veo), visual brainstorming
- **Codex/ChatGPT:** Code review, bug hunting, alternative implementations

## Style Guide Summary
- Palette: dark night sky (#0a0a1a), sand (#f3a35c), hologram cyan (#6ff7ff), warm white (#ffe8c0)
- Astronaut: round helmet, stubby limbs, clumsy animations (trips, falls, gets back up)
- Holograms: translucent cyan structures that build tier-by-tier from the ground up
- Tone: wonder and discovery, never preachy. The astronaut is genuinely amazed by what they find.
