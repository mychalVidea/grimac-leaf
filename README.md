# GrimAC – Leaf Async Edition

> **Auto-synced & compiled fork** of [GrimAnticheat/Grim](https://github.com/GrimAnticheat/Grim) with a **Leaf-server async patch** — makes GrimAC run fully off the main server thread via Folia/Leaf Async Schedulers.  
> No manual maintenance required — GitHub Actions rebuilds it **automatically every week**.

[![Latest Release](https://img.shields.io/github/v/release/mychalVidea/grimac-leaf?label=latest%20build&color=brightgreen)](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)
[![Auto-Build](https://img.shields.io/github/actions/workflow/status/mychalVidea/grimac-leaf/auto-build.yml?label=auto-build)](https://github.com/mychalVidea/grimac-leaf/actions)

---

## 📥 Download

Always grab the latest JAR from the Releases page:  
👉 **[Releases → latest-leaf-build](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)**

Drop it in your server's `plugins/` folder. No extra configuration needed.

---

## ⚡ Why this fork exists

Stock GrimAC checks for `io.papermc.paper.threadedregions.RegionizedServer` (pure Folia) to enable its async schedulers. **Leaf** is a high-performance Paper fork with async/Folia-compatible internals — but it's *not* Folia, so GrimAC falls back to running everything on the main server tick thread. This fork fixes that.

| Feature | Stock GrimAC on Leaf | This fork |
|---|---|---|
| Platform detected as | `BUKKIT` (main thread) | `FOLIA` (async) |
| Tick-end checks | main thread | `Bukkit.getAsyncScheduler()` |
| Block/chunk caching | `HashMap` | `ConcurrentHashMap` |
| TPS impact | noticeable under load | near-zero |
| Auto-update | manual | every Sunday + on-demand |

### The patch (one line)

In `GrimAPI.java`, platform detection now includes a Leaf class check:

```java
// Before
if (ReflectionUtils.hasClass("io.papermc.paper.threadedregions.RegionizedServer")) return Platform.FOLIA;

// After
if (ReflectionUtils.hasClass("io.papermc.paper.threadedregions.RegionizedServer")
    || ReflectionUtils.hasClass("org.dreeam.leaf.event.AsyncPreAuthenticateEvent")) return Platform.FOLIA;
```

This single change causes GrimAC to activate `FoliaPlatformScheduler`, offloading all checks to `Bukkit.getAsyncScheduler()` and using thread-safe concurrent structures throughout.

---

## 🔄 How auto-updates work

Every **Sunday at 04:00 UTC** a GitHub Actions runner:
1. Pulls the latest commit from `GrimAnticheat/Grim` (branch `2.0`).
2. Strips the Fabric modules (faster build).
3. Applies the Leaf async detection patch.
4. Compiles `grimac-bukkit-{version}.jar`.
5. Publishes it to the **Releases** tab (replacing the previous build).

You don't have to do anything — just **watch this repo for releases** (the 👁 Watch button → Custom → Releases).

Want a build right now? Go to **Actions → Auto-Sync & Build GrimAC for Leaf → Run workflow**.

---

## 🛠️ Compatibility

- **Server software:** [LeafMC](https://github.com/Winds-Studio/Leaf) 26.2 / 26.3
- **Minecraft version:** 26.2 – 26.3
- **Java:** 21 (LTS)
- **Based on:** GrimAC `2.0` branch

---

<details>
<summary>🇨🇿 Česky</summary>

### Stažení

Nejnovější zkompilovaný JAR najdeš vždy v záložce Releases:  
👉 **[Releases / latest-leaf-build](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)**

### Proč tento fork?

Standardní GrimAC na Leaf serveru detekuje platformu jako obyčejný Bukkit a spouští veškeré kontroly pohybu v **hlavním serverovém vlákně**. Leaf (výkonnostní Paper fork) přitom nativně podporuje Folia/Async schedulery — ale GrimAC to bez patche neví. 

Tento fork přidá jediný řádek do `GrimAPI.java`, díky kterému GrimAC rozpozná Leaf jako asynchronní platformu a přesune **všechny výpočty a tick-end checky** do `Bukkit.getAsyncScheduler()`. Výsledkem je:
- **Nulový dopad na TPS** i při vysokém počtu hráčů.
- **Thread-safe chunk caching** přes `ConcurrentHashMap`.
- Grim dělá svou práci mimo hlavní vlákno serveru.

### Jak fungují automatické aktualizace

Každou neděli v 04:00 UTC GitHub Actions automaticky:
1. Stáhne nejnovější kód z `GrimAnticheat/Grim` (větev `2.0`).
2. Odstraní Fabric moduly (rychlejší build).
3. Aplikuje Leaf async patch.
4. Zkompiluje `grimac-bukkit.jar`.
5. Nahraje ho do sekce **Releases**.

Stačí zapnout notifikace (👁 Watch → Custom → Releases) a vždy uvidíš nový build.  
Chceš build hned? **Actions → Auto-Sync & Build GrimAC for Leaf → Run workflow**.

</details>
