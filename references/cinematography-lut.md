# Cinematography Lookup Tables

## Scope

This LUT is used during blog article image prompt generation (`article-write`,
`article-gen`, `article-writer` agent). Every image prompt must reference these
tables for specific values — lighting patterns, Kelvin temperatures,
cinematographer signatures, film stocks, shot types, and atmosphere elements.

Use this alongside `image-prompt-guide.md` which defines the 8-element WOW
framework and 5-paragraph prompt structure.

---

## 1. Emotion → Expression → Setup

| Emotion | Expression Keywords | Lighting | Lens | Camera |
|---------|-------------------|----------|------|--------|
| **Shock** | Wide eyes, raised brows, open mouth, frozen | Split 8:1, harsh key | 85mm CU | Static or quick push-in |
| **Curiosity** | Bright eyes, head tilt, raised brows | Soft key 4:1 | 50mm MCU | Gentle push-in |
| **Confidence** | Steady gaze, subtle smile, squared shoulders | Rembrandt 4:1, 3200K | 85mm CU | Static or slow push-in |
| **Excitement** | Bright eyes, genuine smile, lifted brows | High-key 2:1, warm | 50mm MCU | Tracking or gentle orbit |
| **Tension** | Furrowed brow, tight lips, intense gaze | Chiaroscuro 8:1+ | 35mm, Dutch | Slow push-in or handheld |
| **Awe** | Softened eyes, open mouth, relaxed brow | Rim + volumetric | 24mm WS | Crane rise |
| **Warmth** | Warm smile, soft eyes, relaxed posture | Butterfly 2:1, 3500K | 85mm CU | Gentle approach |
| **Authority** | Steady gaze, knowing smile, steepled hands | Rembrandt 4:1, 3200K | 85mm, slight low | Static |
| **Contemplation** | Downcast eyes, hand near chin | Soft side 4:1 | 50mm MCU | Static or slow drift |
| **Intrigue** | Slightly narrowed eyes, gentle head tilt, focused gaze | Low-key, mysterious | 50mm MCU | Gentle push-in |
| **Resolution** | Relaxed brow, subtle confident smile, steady eye contact | Balanced 3-point, warm 3200K | 50mm MCU | Static |
| **Fear/Concern** | Wide eyes, tense lips, raised inner brows | Underlit, cold 6500K+ | 35mm | Handheld |
| **Determination** | Set jaw, focused eyes, slight brow furrow | Strong key, minimal fill | 85mm CU | Static or push-in |

## 1b. Expression Keyword Phrases

### Positive States

| State | Keyword Phrase |
|-------|---------------|
| Joy | "bright genuine smile, crinkled eyes, lifted cheeks" |
| Confidence | "steady gaze, subtle knowing smile, squared shoulders" |
| Warmth | "soft warm smile, gentle open eyes, relaxed brow" |
| Excitement | "wide bright eyes, open genuine smile, raised brows" |
| Serenity | "peaceful closed-lip smile, soft eyes, relaxed features" |
| Gratitude | "warm appreciative smile, soft glistening eyes, open expression" |

### Neutral States

| State | Keyword Phrase |
|-------|---------------|
| Contemplation | "thoughtful downcast eyes, hand near chin, relaxed mouth" |
| Curiosity | "bright inquisitive eyes, slight head tilt, parted lips" |
| Focus | "narrowed concentrated eyes, set jaw, still posture" |
| Intrigue | "slightly narrowed eyes, gentle head tilt, subtle smile" |
| Resolution | "calm steady gaze, relaxed brow, confident subtle smile" |

### Tension States

| State | Keyword Phrase |
|-------|---------------|
| Tension | "furrowed brow, tight pressed lips, intense focused gaze" |
| Fear | "wide alarmed eyes, tense parted lips, raised inner brows" |
| Determination | "set jaw, focused intense eyes, slight brow furrow" |
| Shock | "wide frozen eyes, raised brows, open mouth, rigid posture" |
| Anger | "narrowed eyes, clenched jaw, flared nostrils, tense brow" |

---

## 2. Lighting Patterns

| Pattern | Key Position | Mood | Prompt Phrase |
|---------|-------------|------|---------------|
| **Rembrandt** | 45° side, above eye | Dramatic, authority | "Rembrandt lighting, triangle shadow" |
| **Butterfly** | Directly above, on-axis | Glamorous, beauty | "Butterfly lighting, glamorous" |
| **Split** | 90° direct side | Intense, duality | "Split lighting, half-face shadow" |
| **Loop** | 30-45° from camera | Natural, flattering | "Soft loop lighting, flattering" |
| **Rim/Edge** | Behind subject | Separation, drama | "Strong rim light, edge separation" |
| **Broad** | Lit side toward camera | Wider appearance | "Broad lighting, open" |
| **Short** | Shadow side toward camera | Slimming, moody | "Short lighting, sculptural" |

| Ratio | Contrast | Use Case |
|-------|----------|----------|
| 2:1 | Subtle | Beauty, commercial, lifestyle |
| 4:1 | Moderate | Standard drama, editorial |
| 8:1 | High | Thriller, tension, dramatic |
| 16:1 | Extreme | Horror, extreme drama |

---

## 3. Color Temperature

| Source | Kelvin | Character | Prompt Phrase |
|--------|--------|-----------|---------------|
| Candlelight | 1900K | Deep warm orange | "candlelit 1900K warm glow" |
| Tungsten bulb | 2700K | Warm amber | "tungsten 2700K amber" |
| Tungsten | 3200K | Classic warm | "tungsten 3200K warm" |
| Golden hour | 3500K | Magic gold | "golden hour 3500K" |
| Midday | 5600K | Neutral | "daylight 5600K neutral" |
| Overcast | 6500K | Cool soft | "overcast 6500K diffused" |
| Shade | 7500K | Cool blue | "open shade 7500K cool" |
| Blue hour | 9000-12000K | Twilight blue | "blue hour 9000K mystery" |

**Default recommendation: 3200-3500K warm range for most blog article images.**

---

## 4. Cinematographer Signatures

| DP | Signature Look | Key Techniques | Prompt Style |
|----|---------------|----------------|--------------|
| **Roger Deakins** | Natural motivated light, precise composition | Single-source key, subtle fill, practical motivation | "Deakins natural motivated lighting, precise composition, minimal fill" |
| **Greig Fraser** | Atmospheric, desaturated, textured | Mixed media, natural haze, muted palette | "Fraser atmospheric desaturated texture, natural haze, mixed format" |
| **Hoyte Van Hoytema** | Large-format, immersive, organic | IMAX, natural light preference, minimal filtration | "Van Hoytema large-format organic, immersive natural light" |
| **Bradford Young** | Underexposed, rich shadows, low-key | Dark skin-tone mastery, motivated practicals | "Bradford Young underexposed rich shadows, low-key practicals" |
| **Emmanuel Lubezki** | Long-take natural light, fluid | Natural/magic hour, wide-angle close | "Lubezki natural light fluid, magic hour wide-angle intimate" |
| **Denis Villeneuve** | Stark minimalism, monumental scale | Wide empty compositions, muted palette, moody atmosphere | "Villeneuve stark monumental, wide minimalism, moody atmosphere" |
| **Janusz Kaminski** | Silver-retention, high contrast | Bleach bypass, dramatic shadows, cold-warm tension | "Kaminski silver bleach bypass, high contrast dramatic" |
| **Chung-hoon Chung** | Warm intimate, rich color | Close framing, warm practicals, rich blacks | "Chung-hoon Chung warm intimate, rich color, close framing" |

---

## 5. Camera & Lens

| Shot | Frame | Lens | Purpose |
|------|-------|------|---------|
| ECU | Eyes/detail | 100mm macro | Intense detail, abstract data viz |
| CU | Face fills | 85mm f/1.8 | Strong emotion, close portrait |
| MCU | Head+shoulders | 50-85mm | Conversational, mid-emotion |
| MS | Waist up | 50mm | Standard coverage, scene |
| MWS | Knees up | 35mm | Wider action, group scenes |
| WS | Full body+env | 24-35mm | Context, establishing scene |
| EWS | Landscape dominant | 14-18mm | Epic scale, cover images |

| Angle | Psychology | Prompt |
|-------|-----------|--------|
| Eye-level | Neutral, equal | "eye-level neutral" |
| Low angle | Powerful, heroic | "low angle heroic" |
| High angle | Vulnerable, overview | "high angle vulnerable" |
| Dutch 15-25° | Tension, unease | "Dutch angle tension" |
| Bird's eye | Directly overhead | "bird's eye omniscient" |
| Worm's eye | Ground level up | "worm's eye maximum power" |

---

## 6. Film Stocks (Warm Palette Preferred)

| Stock | Character | Best For | Prompt |
|-------|-----------|----------|--------|
| **Kodak Portra 400** | Warm skin, natural | DEFAULT — portraits, lifestyle, articles | "Kodak Portra 400 warm skin tones" |
| **Kodak Vision3 500T** | Hollywood warm | Dramatic, professional | "Kodak Vision3 500T tungsten" |
| **Kodak Vision3 250D** | Crisp, accurate | Daylight, outdoor | "Kodak 250D daylight crisp" |
| **Kodak Ektar 100** | Vivid saturated | Colorful scenes, outdoors | "Kodak Ektar 100 saturated vivid" |
| **Kodak Portra 800** | Versatile, slightly more grain | Low light, versatile | "Portra 800 natural warmth" |
| **Kodak Tri-X 400** | High contrast B&W grain | Black & white drama | "Tri-X black and white contrasty" |
| **CineStill 800T** | Halation glow | Night, neon (use warm) | "CineStill 800T warm halation" |
| **Fujifilm Velvia** | Extreme saturation | Landscapes | "Velvia hyper-saturated" |

**Default: Kodak Portra 400 for all blog article images unless topic specifically demands otherwise.**

---

## 7. Color Grading Styles

| Style | Description | Use Case | Prompt Phrase |
|-------|-------------|----------|---------------|
| **Teal & Orange** | Complementary color split, warm skin vs cool shadows | Blockbuster, cinematic | "teal and orange color grade, complementary cinematic" |
| **Bleach Bypass** | Desaturated, high contrast, silver retained | Gritty, thriller | "bleach bypass desaturated high contrast gritty" |
| **Golden Hour** | Warm overall push, lifted shadows | Romance, lifestyle, business | "golden hour warm grade, lifted amber shadows" |
| **Blue Hour** | Cool blue tones, twilight mood | Mystery, melancholy | "blue hour cool grade, twilight mood" |
| **Muted/Desaturated** | Pulled saturation, lifted blacks | Indie, art house, editorial | "muted desaturated grade, lifted blacks indie" |
| **Cross-Process** | Shifted hues, unexpected color casts | Experimental, retro | "cross-process shifted hues experimental retro" |
| **Day for Night** | Blue push, crushed shadows | Simulated night | "day for night blue push, deep crushed shadows" |

**Default: Warm golden amber grade (Portra 400 natural look) for most blog articles.**

---

## 8. Atmosphere Elements

| Type | Particle | Effect | Prompt Phrase |
|------|----------|--------|---------------|
| **Haze** | Fine | Light rays, depth | "atmospheric haze volumetric rays" |
| **Fog** | Large | Thick, mysterious | "thick fog mysterious" |
| **Ground fog** | Heavy, low | Floor mist | "ground fog low mist" |
| **Smoke** | Variable | Noir, dramatic | "wispy smoke noir atmosphere" |
| **Rain** | Water | Wet, moody | "rain backlit streaking" |
| **Snow** | Flakes | Cold, soft | "falling snow soft diffused" |
| **Dust** | Fine | Golden particles | "golden dust particles in warm light" |
| **Bokeh** | — | Subject isolation | "warm bokeh background, golden circles" |
| **Edison bulbs** | — | Lifestyle warmth | "Edison bulb warm glow, shallow DOF" |

### 8a. Volumetric Lighting Setups

| Setup | Description | Prompt Phrase |
|-------|-------------|---------------|
| **God rays** | Beams through atmosphere | "god rays streaming through haze, volumetric beams" |
| **Window blinds** | Patterned light slats | "light through venetian blinds, striped shadow pattern" |
| **Backlit particles** | Rim-lit floating dust/haze | "backlit particles glowing, rim-lit dust atmosphere" |
| **Smoke shafts** | Light cutting through smoke | "light shafts through smoke, dramatic volumetric" |

### 8b. Surface Effects

| Effect | Description | Prompt Phrase |
|--------|-------------|---------------|
| **Wet streets** | Reflective, moody ground | "wet street reflections, rain-slicked pavement glow" |
| **Puddle reflections** | Mirror-like ground reflections | "puddle reflections, mirrored city lights" |
| **Frost** | Ice crystal texture | "frost-covered surface, ice crystal texture cold" |
| **Steam** | Rising vapor, warmth | "rising steam atmosphere, warm vapor diffusion" |

---

## 9. Quick Combos — Content Type → Setup

Blog article images serve two roles:
- **Cover image** = the article's thumbnail/hero — scroll-stopping, dramatic, must
  encapsulate the article's promise in a single glance (like a social media
  thumbnail). Prefer tight CU framing over wide establishing shots.
- **Inline images** = support the article's narrative, can be any scale
  (scene, portrait, abstract, product, group).

| Content | Shot | Lens | Lighting | Film Stock |
|---------|------|------|----------|------------|
| **Cover image (thumbnail/hero)** | CU or MCU tight | 85mm f/1.8 | Rembrandt 4:1-6:1, 3200K | Portra 400 |
| **Inline: portrait scene** | CU or MCU | 85mm f/1.8 | Rembrandt 4:1, 3200K | Portra 400 |
| **Inline: person in environment** | MS | 50mm f/2.0 | Loop 3:1, 3500K | Portra 400 |
| **Inline: data / abstract concept** | ECU or MS | 100mm macro or 35mm | Rim + volumetric | Vision3 500T |
| **Inline: scene / environment** | WS | 24-35mm | Natural/golden hour | Portra 400 |
| **Inline: object / product detail** | CU | 85mm f/2.8 | Soft 2:1, 3200K | Vision3 250D |
| **Inline: group interaction** | MS or MWS | 35-50mm | Loop 3:1, mixed temp | Portra 400 |
| **Inline: epic wide establishing** | WS or EWS | 24mm f/2.8 | Rim + volumetric | Portra 400 |

### 9a. Mood → Complete Setup

| Mood | Lighting | Grade | Atmosphere | Framing |
|------|----------|-------|------------|---------|
| **Tense thriller** | Split 8:1, cool 5600K | Bleach bypass | Heavy haze | 35mm Dutch |
| **Mystery intrigue** | Low-key 8:1, cool | Desaturated teal | Fog | 35mm |
| **Epic reveal** | Rim + volumetric | Teal orange | Dust, god rays | 24mm crane |
| **Intimate dialogue** | Soft 4:1, warm practical | Portra, natural | Clean | 85mm |
| **Urban noir** | Hard 8:1, mixed temp | CineStill 800T | Rain, wet streets | 35mm low |
| **Tech/modern** | Clean 2:1, 5600K | Neutral, slight teal | Clean, screen glow | 50mm |
| **Business authority** | Rembrandt 4:1, 3200K | Portra warm | Minimal haze | 50-85mm |
| **Lifestyle warmth** | Loop 2:1, 3500K | Golden hour | Natural particles | 50mm f/1.8 |
