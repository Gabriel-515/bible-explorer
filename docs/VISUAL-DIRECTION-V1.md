# Bible Explorer — Visual Direction V1

> Canonical visual direction for the Godot exploration-scene reboot.
>
> Status: **LOCKED for Eden Visual Spike 02**
>
> This document supersedes older exploration-scene art constraints that required a strict 192×108 canvas, six-color palette, three-plane maximum, or HTML `fillRect()`-style environment construction. Those older prototypes remain useful mechanics references, not the target visual quality.
>
> Narrative canon remains in `docs/NARRATIVE-FOUNDATION.md`.

## 1. Product Feeling

Bible Explorer is a **casual devotional exploration game**.

The primary emotional target is:

- calm
- healing
- reflective
- peaceful
- sacred
- mysterious
- slightly lonely, but never oppressive
- beautiful enough that the player wants to stop moving and simply remain in the environment

The player should leave a session feeling calmer, curious, spiritually reflective, and interested in reading Scripture.

The game is **not** optimized for combat intensity, mechanical difficulty, timers, horror, constant danger, visual clutter, or aggressive cyberpunk energy.

Core fantasy:

> A small archivist walks through enormous lost Biblical worlds, recovering fragments of history, Scripture, life, and meaning.

## 2. Core Visual Reference Mix

These are design references, not templates to copy literally.

### 30% — Hyper Light Drifter

Borrow:

- strong pixel silhouettes
- layered environmental depth
- monumental ruins embedded into landscape
- disciplined jewel-tone palettes
- ancient technology integrated into terrain
- clear foreground / midground / distance separation

Do not borrow:

- combat stress
- gore
- body horror
- oppressive dread
- boss-fight pacing

### 20% — Planet of Lana

Borrow:

- cinematic landscape composition
- soft natural beauty
- large areas of sky and negative space
- tiny-character / huge-world scale
- gentle atmospheric perspective
- broad horizontal framing
- peaceful traversal

Do not borrow:

- punitive stealth
- instant-death tension

**Practical rule:** Hyper Light Drifter informs how the world is rendered; Planet of Lana informs how the world is framed and emotionally presented.

### 20% — Chants of Sennaar + Sable

Borrow:

- monumental sacred architecture
- ancient Near-Eastern scale and geometry
- warm stone and sun-bleached surfaces
- quiet archaeology
- non-violent curiosity
- futuristic technology sitting naturally beside ancient environments

Do not borrow:

- overly sparse 3D open-world emptiness
- stealth-pressure sequences
- heavy vector rendering as the final pixel language

### 15% — GRIS

Borrow:

- healing through color
- restoration as an emotional visual event
- restrained environments blooming into life
- monumental sacred geometry
- theatrical reveals

Do not borrow:

- abstract floaty platforming
- psychological-horror imagery

### 15% — Original Bible Explorer Identity

Own:

- ARCHIVIST-07
- archival scanner
- Scripture reconstruction
- cyan machine/recovery language
- restrained gold life/divine-anomaly language
- calculation versus meaning
- non-punitive devotion pacing
- ancient Biblical worlds reconstructed through uncertain archaeological evidence

## 3. Visual Pillar

> **A calm cinematic 2D pilgrimage through enormous Biblical landscapes, combining Hyper Light Drifter's layered environmental clarity with Planet of Lana's soft cinematic scale and natural beauty, grounded by sacred ancient architecture and restorative color.**

Alternative short form:

> **A calm, healing sci-fi pilgrimage through enormous lost Biblical worlds.**

## 4. Environment Comes First

Visual priority order:

1. environment scale
2. atmosphere and weather
3. lighting
4. character silhouette
5. reconstruction effects
6. UI

ARCHIVIST-07 should often feel physically small compared with trees, towers, ruins, mountains, walls, flood structures, caves, and landscapes.

The environment should carry emotional meaning before dialogue or UI explains it.

## 5. Working Resolution and Pixel Discipline

For the Godot exploration reboot:

- **working logical resolution: 384×216**
- 16:9
- nearest-neighbor filtering for pixel-authored assets
- integer scaling when practical
- crisp pixel-grid discipline
- no requirement to return to 192×108
- do not use the former six-color limitation

The visual goal is detailed modern pixel / pixel-inspired 2D, not deliberately crude retro graphics.

Avoid sub-pixel visual mush on pixel-authored elements. Smooth camera behavior may use techniques that preserve visual stability without forcing every system into low-resolution jitter.

## 6. Color Semantics

These meanings remain consistent across locations:

- **Cyan** = machine, archive, scanner, reconstruction, recovered information
- **Gold / warm amber** = life, grace, sacred anomaly, unexplained meaning

Gold should be restrained. It should gain emotional power from rarity.

Do not use cyan and gold as generic decoration.

## 7. Weather Is Storytelling

Every Biblical location should have a distinct combination of:

- weather
- palette
- soundscape
- environmental motion
- lighting

Examples:

- Eden: dawn mist, still air, spores, sleeping watercourses
- Babel: dry heat, dust, high sunset, kiln haze
- Flood / Ararat: wet stone, receding storm, cold blue air
- Canaan: wind across ridges, warm horizon, distant camp light
- Egypt: dry heat, Nile reflections, monumental sunlit stone

Weather should make the world feel alive without creating stress.

## 8. Audio Direction

Audio should support devotion rather than constantly demand attention.

General target:

- roughly 40–70 BPM where music has a pulse
- sparse felted piano
- acoustic guitar
- warm analog pads
- cello / soft strings
- environmental field-recording character
- long periods of intentional silence

The game should often sound like:

- wind
- footsteps
- distant birds
- moving water
- sparse musical notes
- room / landscape tone

Scanner sounds should be soft, tactile, harmonic, and organic rather than harsh sci-fi beeps.

## 9. ARCHIVIST-07 Visual Direction

The astronaut is a field researcher, not a soldier, superhero, or mascot.

Direction:

- small, readable silhouette
- utilitarian archival EVA suit
- pale ceramic / off-white body
- slate flexible joints
- oversized dark-cyan visor
- compact life-support / archive backpack
- muted orange utility or harness accent
- wrist or handheld scanner
- slightly stocky enough to remain legible at low resolution

Movement should feel quiet, deliberate, and curious.

No action-hero body language.

## 9.1 Approved Eden Keyframe Reference

**Selected reference:** ChatGPT-generated **Eden Concept Version 3**.

This is the authoritative visual north star for Eden Visual Spike 02.

Key qualities to preserve:
- mobile-first composition, not a giant PC-scale game
- cinematic side-view framing
- ARCHIVIST-07 readable on a phone while still feeling small
- enormous Tree of Knowledge dominating the right side
- open mist-filled valley through the center
- clear walkable ledge/path on the left
- strong foreground framing without blocking gameplay
- pale lavender / peach dawn light
- dusty blue atmospheric distance
- warm bone stone
- desaturated sage foliage
- restrained amber/gold life hints
- layered depth inspired by Hyper Light Drifter
- softness, negative space, and tiny-character/huge-world framing inspired by Planet of Lana
- peaceful, healing, devotional mood

The Godot implementation should **translate this composition**, not reinterpret it into a flat programmer-art scene.

Expected repository asset path once the image is saved into the project:
`art/reference/eden-keyframe-v3.png`

If that asset is present, Claude/Codex should treat it as the primary image reference together with this document.

## 10. EDEN VISUAL SPIKE 02 — Keyframe

### Scene title

**Arrival at the Sleeping Garden**

### Emotional premise

Eden is not a horror wasteland.

It is a **sleeping sanctuary**: ancient, still, beautiful, sacred, and arrested in time.

The player should feel sadness and wonder, but also safety.

### Composition

ARCHIVIST-07 enters a vast dried river terrace.

Foreground roots partially frame the view.

As the player advances, the composition opens to reveal the Tree of Knowledge as the hero landmark.

The Tree:

- fills roughly 40–50% of the important composition
- has roots several times larger than the astronaut
- extends beyond the top of the visible frame
- feels partly botanical and partly architectural
- contains only very restrained hints of dormant warm amber within bark fissures

ARCHIVIST-07 should occupy approximately **8–10% of screen height** in the key composition.

The camera should make the player feel tiny without making the character unreadable.

### Dormant Eden palette

- sky: pale lavender-grey
- distance: dusty blue-grey
- stone: warm bone / limestone
- vegetation: desaturated sage
- deep silhouettes: muted indigo
- mist: cool pearl-grey
- scanner: restrained cyan
- sacred/life anomaly: very small amounts of warm gold

Avoid:

- radioactive green
- large pure-black masses
- muddy brown dominance
- excessive neon
- constant glowing effects

### Eden depth stack

1. sky / distant celestial atmosphere
2. giant distant landforms / canopy silhouettes
3. petrified forest
4. drifting atmospheric mist
5. midground terraces / ancient vegetation
6. Tree of Knowledge + gameplay plane
7. ARCHIVIST-07
8. foreground roots / plants crossing the camera
9. thin fog / spores / subtle lighting effects

Layer count is not a hard technical restriction. Use enough depth to achieve the scene.

### Ambient motion

Keep motion subtle:

- slow horizontal fog
- tiny spores drifting upward
- slight foreground plant movement
- almost imperceptible cloud movement
- occasional distant life movement
- faint dormant amber pulse deep in the Tree

Nothing should constantly demand attention.

### First wow moment

After several seconds of walking, foreground roots open and the camera reveals the enormous Tree of Knowledge.

No dialogue is required.

Prefer:

- wind
- a few spores
- one restrained musical note or swell
- camera composition doing the storytelling

## 11. Restoration Language

Restoration should feel emotionally meaningful, not like a generic VFX power-up.

Dormant environments begin restrained and desaturated.

Recovered Scripture / meaningful discoveries may gradually return:

- color
- water
- plant movement
- light
- warmth
- living detail

Cyan reconstruction is informational.

Gold/life restoration is existential and should remain less mechanically explicit.

Do not use restoration as proof of a miracle or as a simplistic "God meter."

## 12. Godot Production Direction

Godot is the exploration-scene production engine for the current visual reboot experiment.

For Spike 02:

- keep the existing movement / camera / parallax technical foundation
- use real imported art assets rather than relying on procedural rectangle art
- use layered 2D scenes
- use `Parallax2D`, `Camera2D`, particles, shaders, and 2D lighting only where they improve the atmosphere
- avoid plugin/template dependency unless a specific limitation justifies it
- do not duplicate the authoritative HTML `game-state.js` state model yet
- do not build the web bridge during the visual proof

The existing HTML app remains authoritative for Reader / Hub / Journal / other shell systems until a later integration decision.

## 13. Eden Visual Spike 02 Scope

Build **one beautiful playable Eden section**.

Must prove:

- environment scale
- art direction
- calm movement
- cinematic camera
- parallax depth
- atmosphere / weather
- foreground occlusion
- one strong hero composition

Do **not** add yet:

- combat
- inventory
- seed progression
- transmitter progression
- full dialogue
- full restoration sequence
- WebBridge
- plugin architecture
- full Eden V1 content

## 14. Acceptance Test

Spike 02 passes if:

> The player would willingly stand still in the scene for 20 seconds because it feels beautiful, peaceful, and worth inhabiting.

Secondary checks:

- Does the world feel substantially more polished than the old HTML Eden?
- Does ARCHIVIST-07 feel small against the environment?
- Does Planet-of-Lana-style composition give the scene breathing room?
- Does HLD-style pixel depth remain readable?
- Does the environment feel devotional rather than merely "cool"?
- Does the scene invite reflection rather than urgency?

Technical sophistication without emotional calm is not a pass.

## 15. Agent Operating Rules

### ChatGPT

Own:

- art-direction synthesis
- narrative consistency
- architecture
- acceptance criteria
- milestone decisions

### Gabriel

Own:

- visual taste
- final aesthetic approval
- Godot visual composition adjustments

### Claude

Use for:

- scene implementation
- GDScript
- shaders
- particles
- camera polish
- bounded Godot visual tasks

Claude must read:

1. `docs/NARRATIVE-FOUNDATION.md`
2. `docs/VISUAL-DIRECTION-V1.md`
3. current Godot scene/files
4. relevant current task only

Do not rediscover or redesign accepted art direction after context compaction. Recover from Git and canonical docs.

### Codex

Use for:

- repository edits
- Godot CLI validation
- asset import mechanics
- Git discipline
- automated checks
- bounded implementation tasks

### Gemini

Use for:

- visual research
- multimodal reference analysis
- external game / art research

Do not continue broad visual-reference research unless a concrete production question requires it.

## 16. Supersession Rule

If older project documents conflict with this file on **exploration visual style**, this document wins.

Specifically superseded for the Godot exploration reboot:

- mandatory 192×108 canvas
- strict six-color Eden palette
- maximum three depth planes
- code-drawn rectangle environments as target art
- assumption that exploration scenes must remain HTML Canvas

Not superseded:

- Biblical/historical scene context
- narrative foundation
- theological restraint
- uncertain-location handling
- Scripture progression concepts
- cyan/gold semantic distinction where compatible
