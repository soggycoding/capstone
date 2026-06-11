# Godot Stealth Survival Capstone - 16 Week Development Roadmap
**Start Date:** Mid-August | **Target Completion:** November-December | **Total Duration:** 16 Weeks

---

## Overview
You're building a 5-level stealth survival horror game with:
- Lobby + level select system
- Top-down exploration in one large forest with unlockable areas
- 4 unique enemy types (Weeping Angel, Slenderman, Siren Head, Shadow Figures)
- Mini-game mechanic (generator repair timing, like Dead by Daylight)
- Item collection system (3 relics for true ending)
- Multiple endings based on collectibles
- Target playtime: 30-60 minutes

---

## Daily Schedule Template
- **Monday-Friday (4-5 hours/day):** Godot game development
- **One day per week (2-3 hours):** Backend/Frontend learning (maintain skills)
- **One full day off:** Rest & relaxation (no coding)

---

## PHASE 1: Foundation & Core Systems (Weeks 1-3)

### Week 1: Project Setup & Top-Down Movement

**Tutorial Links:**
- **Top-down movement:** https://www.youtube.com/watch?v=M66_K_oZdcg (Smooth Top-Down Movement)
- **Alternative:** https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/ (Godot Recipes)

**Daily Tasks:**
- **Day 1:** Set up project structure, import your sprite sheets, confirm animations work
- **Day 2-3:** Follow top-down movement tutorial, implement player movement with your character sprite
- **Day 4:** Add camera following player, test smooth movement
- **Day 5:** Create a simple test level (use TileMaps for forest), test movement across different areas

**Deliverable:** 
- Player moves smoothly in 4 directions
- Camera follows player
- Basic forest map created and explorable

**Weekly Check-in Questions:**
- Does movement feel responsive with your pixel art?
- Is camera framing comfortable?
- Any collision issues with tilemap?

---

### Week 2: Scene Management & Lobby Setup

**Tutorial Links:**
- **Main menu/scene transitions:** https://gamedevartisan.com/tutorials/godot-fundamentals/menus-and-scene-transitions
- **Level select UI:** https://kidscancode.org/godot_recipes/4.x/ui/level_select/
- **YouTube:** https://www.youtube.com/watch?v=vsKxB66_ngw (Main Menu Beginner Tutorial)

**Daily Tasks:**
- **Day 1:** Create lobby scene structure (main menu, level select layout)
- **Day 2-3:** Build level select UI with 5 locked level buttons, create simple transitions between scenes
- **Day 4:** Set up level scenes (Level 1-5), create scene management system so clicking buttons loads levels
- **Day 5:** Create basic "Game Over" and "Win" scenes that loop back to menu

**Deliverable:**
- Functional lobby with 5 levels (all playable but empty)
- Scene transitions work smoothly
- Can play a level and return to menu

**Weekly Check-in Questions:**
- Can you navigate between all scenes without errors?
- Are button interactions responsive?
- Does it feel like a complete game flow?

---

### Week 3: Basic Enemy Setup & Movement

**Tutorial Links:**
- **Enemy AI basics:** https://codingquests.io/blog/godot-4-enemy-ai-tutorial (patrol/chase states)
- **Alternative:** https://www.toolify.ai/ai-news/master-the-art-of-enemy-ai-in-godot-4-2279618
- **Vision detection:** https://www.youtube.com/watch?v=nH2XL3sWe3g (Cone detection for 2D)

**Daily Tasks:**
- **Day 1:** Create a basic enemy scene (use one of your sprite assets, pick Slenderman for simplicity)
- **Day 2:** Implement patrol behavior (waypoint system - enemy walks between set points)
- **Day 3:** Add detection system - enemy enters "chase" state when player gets close
- **Day 4-5:** Create detection area (simple circle collision for now, not vision cone yet), test chase behavior

**Deliverable:**
- One enemy that patrols and chases player
- Enemy stops chasing after player leaves detection range
- No combat yet (just chase behavior)

**Weekly Check-in Questions:**
- Does enemy patrol feel natural?
- Does detection distance feel balanced?
- Can player escape easily?

---

## PHASE 2: Enemy Variety & Stealth Mechanics (Weeks 4-6)

### Week 4: Advanced Enemy Detection & Vision Cones

**Tutorial Links:**
- **Vision cone plugin:** https://github.com/d-bucur/godot-vision-cone (2D vision detection)
- **DIY raycast approach:** https://www.youtube.com/watch?v=GObXC_G_DZo (vision detection without plugin)

**Daily Tasks:**
- **Day 1-2:** Implement vision cone system for Slenderman (cone-shaped detection area)
- **Day 3:** Create second enemy type - Weeping Angel (special behavior: can only move when player isn't looking at it)
- **Day 4:** Test both enemies together in a small test arena
- **Day 5:** Polish - adjust vision ranges, speeds, detection sensitivity

**Deliverable:**
- Slenderman with vision cone detection
- Weeping Angel that implements "don't look at me" mechanic (you'll use player direction for this)
- Both enemies can coexist in same level

**Weekly Check-in Questions:**
- How will you implement the "Weeping Angel can't move when watched" mechanic?
- Is vision cone performance acceptable?
- Do enemies feel distinct in behavior?

---

### Week 5: Additional Enemy Types & Audio-Based Detection

**Tutorial Links:**
- **State machines:** https://codingquests.io/blog/godot-4-enemy-ai-tutorial (advanced state patterns)
- **Audio implementation:** Search "Godot 4 audio player tutorial" on YouTube

**Daily Tasks:**
- **Day 1-2:** Create Shadow Figures (distraction enemies that don't directly chase, just patrol and create atmosphere)
- **Day 3:** Implement Siren Head with audio-based detection (use AudioStreamPlayer to create siren sound, triggers when nearby)
- **Day 4:** Test all 4 enemy types in one arena
- **Day 5:** Balance - adjust speeds, detection ranges, behavior patterns

**Deliverable:**
- All 4 enemy types implemented and functioning
- Each has distinct behavior/detection method
- Can spawn multiple enemies in same level

**Weekly Check-in Questions:**
- Which enemy feels most threatening/interesting?
- Is audio for Siren Head working correctly?
- Do enemies feel like they belong in same game?

---

### Week 6: Stealth Mechanics & Hiding

**Tutorial Links:**
- **Stealth systems:** Search "Godot 4 stealth mechanics" or adapt from your detection system
- **Hiding spots:** Use Area2D with a "hiding" flag

**Daily Tasks:**
- **Day 1:** Create "hiding spots" (designate areas where player can hide - behind trees, rocks)
- **Day 2-3:** Implement hiding logic - when in hiding area, enemies can't detect you (or detection reduced)
- **Day 4:** Add footstep noise system - movement makes sound, standing still is quieter (affects Siren Head detection)
- **Day 5:** Test stealth flow - sneak past enemies, get caught, hide, escape

**Deliverable:**
- Player can hide in designated spots
- Enemies lose detection when player hides
- Sound-based detection for Siren Head implemented

**Weekly Check-in Questions:**
- Does hiding feel like a valid strategy?
- Can you complete a section using pure stealth?
- What balance adjustments do enemies need?

---

## PHASE 3: Game Mechanics & Items (Weeks 7-9)

### Week 7: Item Collection & Inventory System

**Tutorial Links:**
- **Simple inventory:** Search "Godot 4 pickup system" or "collectible items"
- **Example:** https://github.com/godotrecipes (has inventory examples)

**Daily Tasks:**
- **Day 1:** Create gas can item (pickups scattered in levels)
- **Day 2:** Create relic items (3 total, hidden throughout game)
- **Day 3:** Build inventory system (track items, display on HUD)
- **Day 4:** Create pickup detection and collection mechanics
- **Day 5:** Test - scatter items in a test level, collect them, verify HUD updates

**Deliverable:**
- Items can be placed in levels
- Player can collect gas cans and relics
- HUD shows collected items

**Weekly Check-in Questions:**
- Can you track multiple item types?
- How will you display collected relics vs gas cans on HUD?
- Should items respawn or stay collected?

---

### Week 8: Mini-Game Mechanic (Generator Repair Timing)

**Tutorial Links:**
- **Timing-based mechanics:** Search "Godot 4 rhythm game" or "timing detection"
- **Input timing tutorial:** Look for "Godot 4 button press timing"

**Daily Tasks:**
- **Day 1-2:** Design mini-game scene - player must hold button and release at right time (like Dead by Daylight generator)
- **Day 3:** Create timing bars and success/failure zones
- **Day 4:** If success: generator fixed (allows progression). If fail: enemy alerted (nearby enemies enter alert state)
- **Day 5:** Test mini-game flow, adjust difficulty/timing

**Deliverable:**
- Functioning mini-game mechanic
- Visual feedback for timing
- Success/failure consequences work

**Weekly Check-in Questions:**
- How difficult should the timing be?
- Does failure feel punishing but fair?
- Could you use this mini-game for multiple purposes (generators, locks, etc.)?

---

### Week 9: Win/Lose Conditions & Level Flow

**Tutorial Links:**
- **Scene transitions:** Previous tutorials cover this

**Daily Tasks:**
- **Day 1:** Design win condition - reach motorcycle with collected gas
- **Day 2:** Design lose condition - caught by enemy or time runs out (optional)
- **Day 3:** Create end-of-level UI (level complete, next level unlock)
- **Day 4:** Implement level progression - completing Level 1 unlocks Level 2, etc.
- **Day 5:** Test full level flow - play through a level from start to finish

**Deliverable:**
- Clear win/lose conditions
- Level progression system
- UI feedback for completing levels

**Weekly Check-in Questions:**
- Does progression feel natural?
- Are win conditions challenging but achievable?
- Can you complete a full level without bugs?

---

## PHASE 4: Polish & UI Systems (Weeks 10-12)

### Week 10: HUD & Gameplay UI

**Tutorial Links:**
- **UI design:** https://gamedevartisan.com/tutorials/godot-fundamentals/menus-and-scene-transitions
- **Health/status bars:** Search "Godot 4 HUD tutorial"

**Daily Tasks:**
- **Day 1:** Create HUD layout (gas collected, relics collected, health/status, objective text)
- **Day 2:** Add real-time HUD updates (display current gas, relics, enemy proximity indicator if desired)
- **Day 3:** Create objective text system (tells player what to do)
- **Day 4:** Polish HUD appearance to match pixel art style
- **Day 5:** Test HUD in actual gameplay

**Deliverable:**
- Complete, functional HUD
- Visual clarity on game state
- No performance issues with HUD updates

**Weekly Check-in Questions:**
- Is HUD information clear without being cluttered?
- Does HUD match your pixel art aesthetic?
- Is all necessary info visible?

---

### Week 11: Audio, Atmosphere & Polish

**Tutorial Links:**
- **Godot audio system:** Search "Godot 4 AudioStreamPlayer tutorial"
- **Background music:** Basic audio implementation

**Daily Tasks:**
- **Day 1-2:** Add ambient audio (forest sounds, wind, distant noises)
- **Day 3:** Add enemy audio cues (Siren Head siren, enemy footsteps, detection sounds)
- **Day 4:** Add player feedback audio (footsteps, item pickup, alarm triggered)
- **Day 5:** Add background music, adjust volume levels, test audio mix

**Deliverable:**
- Game has complete audio landscape
- Audio provides useful gameplay feedback
- Audio doesn't overwhelm gameplay

**Weekly Check-in Questions:**
- Does audio enhance atmosphere?
- Can player distinguish important audio cues?
- Is audio performance acceptable?

---

### Week 12: Endings System & Progression Tracking

**Tutorial Links:**
- **Scene management for endings:** Previous menu tutorials

**Daily Tasks:**
- **Day 1-2:** Create ending scenes (normal ending vs true ending with all relics)
- **Day 3:** Implement progression tracking (did player collect all 3 relics?)
- **Day 4:** Create loop-back system (normal ending loops to Level 1, true ending shows credits/end screen)
- **Day 5:** Test both ending paths, verify loop-back works

**Deliverable:**
- Two distinct endings
- Progression tracking works
- Full game loop functions

**Weekly Check-in Questions:**
- Do endings feel rewarding?
- Is true ending motivating enough to collect relics?
- Does loop-back system make sense?

---

## PHASE 5: Level Design & Content Creation (Weeks 13-15)

### Week 13: Vertical Slice #1 - Level 1 (Tutorial)

**Daily Tasks:**
- **Day 1-2:** Design Level 1 layout on paper first (this is tutorial, should be simple)
- **Day 3-4:** Build Level 1 in Godot - place tilemap, create patrol paths, place gas can
- **Day 5:** Playtest Level 1 - should teach player basic movement and stealth without much threat

**Deliverable:**
- Complete, playable Level 1
- Functions as effective tutorial
- Takes ~5-8 minutes to complete

**Weekly Check-in Questions:**
- Does Level 1 teach mechanics effectively?
- Is difficulty appropriate for tutorial?
- Can a new player beat it easily?

---

### Week 14: Levels 2-3 Design & Implementation

**Daily Tasks:**
- **Day 1:** Design Levels 2 and 3 (medium difficulty, introduce 2-3 enemies, 1 relic per level)
- **Day 2-3:** Build Level 2 - larger area, multiple enemies, one mini-game challenge
- **Day 4-5:** Build Level 3 - increased difficulty, different enemy combination

**Deliverable:**
- Levels 2 and 3 complete and playable
- Each level takes ~8-10 minutes
- Difficulty ramp is noticeable but fair

**Weekly Check-in Questions:**
- Are difficulty curves working?
- Does enemy variety keep gameplay fresh?
- Are relics well-hidden but findable?

---

### Week 15: Levels 4-5 & True Ending

**Daily Tasks:**
- **Day 1:** Design Levels 4 and 5 (high difficulty, all 4 enemy types, last relic in Level 5)
- **Day 2-3:** Build Level 4 - challenging combination of enemies and obstacles
- **Day 4:** Build Level 5 - final challenge with all mechanics, third relic leads to true ending
- **Day 5:** Polish true ending, test full game loop from start to finish

**Deliverable:**
- Complete game with all 5 levels
- True ending accessible
- Full game loop playable

**Weekly Check-in Questions:**
- Can you beat the game once?
- Does difficulty progression feel right overall?
- Are all mechanics being used effectively?

---

## PHASE 6: Testing, Balancing & Polish (Week 16)

### Week 16: Playtesting, Bug Fixes & Final Polish

**Daily Tasks:**
- **Day 1-2:** Full playthrough (play entire game start to finish), document all bugs and balance issues
- **Day 3:** Fix bugs (priority: game-breaking → crashes → physics issues → minor glitches)
- **Day 4:** Balance tuning (enemy speeds, detection ranges, item placement, difficulty spike review)
- **Day 5:** Final polish (visual tweaks, audio mixing, menu UX, prepare for submission)

**Deliverable:**
- Bug-free, fully playable game
- Balanced difficulty throughout
- Ready for submission/presentation

**Weekly Check-in Questions:**
- What percentage of level objectives are achievable?
- Do you enjoy playing it?
- What's your biggest concern before submission?

---

## Ongoing Weekly Check-in Format

Every week, come back with:

**Progress:**
- What did you complete?
- What took longer than expected?
- What surprised you?

**Challenges:**
- Any blockers or difficult moments?
- Need help with specific system?

**Adjustments:**
- Should next week change based on progress?
- Are timelines realistic?
- Any scope adjustments needed?

**Demo:**
- Can you show/describe what's working?
- Any specific feedback needed?

---

## Reference Tutorial Links (Consolidated)

**Movement & Controls:**
- Top-down: https://www.youtube.com/watch?v=M66_K_oZdcg
- Alternative: https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/

**Enemy AI:**
- Patrol/Chase: https://codingquests.io/blog/godot-4-enemy-ai-tutorial
- Vision Cones: https://www.youtube.com/watch?v=nH2XL3sWe3g
- Vision Plugin: https://github.com/d-bucur/godot-vision-cone

**UI & Menus:**
- Main Menu: https://www.youtube.com/watch?v=vsKxB66_ngw
- Level Select: https://kidscancode.org/godot_recipes/4.x/ui/level_select/
- Scene Transitions: https://gamedevartisan.com/tutorials/godot-fundamentals/menus-and-scene-transitions

**General Resources:**
- Godot 4 Recipes: https://kidscancode.org/godot_recipes/4.x/
- GDQuest: https://www.gdquest.com/

---

## Success Metrics by Week

- **Week 3:** Player movement works, basic enemy patrols
- **Week 6:** All 4 enemies implemented, stealth mechanics working
- **Week 9:** Full game loop functional (menu → level → end → menu)
- **Week 12:** Game has complete audio, two endings implemented
- **Week 15:** All 5 levels created and playable
- **Week 16:** Game is bug-free and ready

---

## Important Notes

1. **Front-load your learning:** Weeks 1-3 teach you Godot patterns. Later weeks should be faster.
2. **Scope is your friend:** If you fall behind, cut content (maybe drop one enemy type or reduce level count) rather than burning out.
3. **Build incrementally:** Finish full loops early (Weeks 1-9) so you have something playable to test and adjust.
4. **Playtesting is crucial:** Week 16 feels short, but you'll find issues faster if you test progressively.
5. **Document decisions:** Write down why you made certain design choices - useful for capstone presentation.
6. **Backend/Frontend:** Do this 1x/week consistently to maintain skills without derailing game progress.

---

**Good luck! You've got a solid plan. Message me weekly with progress and we'll adjust as needed.**
