# GrimAC – Leaf Edition

> **Auto-synced & compiled fork** of [GrimAnticheat/Grim](https://github.com/GrimAnticheat/Grim) compiled natively against **Leaf API (`cn.dreeam.leaf:leaf-api`) for Minecraft 26.x and Java 25**.  
> No manual maintenance required — GitHub Actions rebuilds it **automatically every week**.

[![Latest Release](https://img.shields.io/github/v/release/mychalVidea/grimac-leaf?label=latest%20build&color=brightgreen)](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)
[![Auto-Build](https://img.shields.io/github/actions/workflow/status/mychalVidea/grimac-leaf/auto-build.yml?label=auto-build)](https://github.com/mychalVidea/grimac-leaf/actions)

---

## 📥 Download

Always grab the latest JAR from the Releases page:  
👉 **[Releases → latest-leaf-build](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)**

Drop `grimac-leaf-{version}.jar` into your server's `plugins/` folder and restart.

---

## ⚡ What this does

| Feature | Upstream GrimAC | This Leaf build |
|---|---|---|
| Target API | `io.papermc.paper:paper-api` | `cn.dreeam.leaf:leaf-api:26.3.local-SNAPSHOT` |
| Java Version | 17 / 21 | **25 (LTS)** |
| Packet Processing | Asynchronous (Netty threads) | **Asynchronous (Netty threads)** |
| Tick Synchronization | Server Tick lockstep | **Server Tick lockstep (zero lag desync)** |
| Auto-update | Manual | Every Sunday + on-demand |

### Architecture

1. **Native Leaf API Target:** Compiles directly against `cn.dreeam.leaf:leaf-api` snapshot releases hosted on the LeafMC Maven repository, using Java 25 target bytecode for modern 26.x server forks.
2. **Asynchronous Packet Engine:** 100% of player movement simulations, collision boxes, raycasts, and reach calculations run asynchronously on Netty packet threads via PacketEvents, keeping your main game thread free.
3. **Tick Lockstep Stability:** Ticking advances in lockstep with the actual server game loop rather than detached wall-clock timers, ensuring 0 false positives during server lag spikes or world loading.

---

## 🔄 How auto-updates work

Every **Sunday at 04:00 UTC** a GitHub Actions runner:
1. Pulls the latest commit from `GrimAnticheat/Grim` (`2.0` branch).
2. Strips Fabric modules for faster compilation.
3. Applies Leaf API maven configuration.
4. Compiles `grimac-leaf-{version}.jar` using Java 25.
5. Publishes it to the **Releases** tab.

You don't have to do anything — just **watch this repo for releases** (the 👁 Watch button → Custom → Releases).

Want a build right now? Go to **Actions → Auto-Sync & Build GrimAC for Leaf → Run workflow**.

---

## 🛠️ Compatibility

- **Server software:** [LeafMC](https://github.com/Winds-Studio/Leaf) 26.2 / 26.3, Purpur, Paper
- **Minecraft version:** 26.2 – 26.3
- **Java:** **25** (LTS)
- **Based on:** GrimAC `2.0` branch

---

<details>
<summary>🇨🇿 Česky</summary>

### Stažení

Nejnovější zkompilovaný JAR najdeš v záložce Releases:  
👉 **[Releases / latest-leaf-build](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)**

Vlož soubor `grimac-leaf-{version}.jar` do složky `plugins/` na serveru a restartuj.

### Proč tento build?

Tento build kompiluje GrimAC 2.0 přímo proti **Leaf API (`cn.dreeam.leaf:leaf-api`)** a cílí na **Java 25**, což zajišťuje maximální kompatibilitu a optimalizaci pro servery běžící na Leafu (Minecraft 26.x).

- **Plně asynchronní kontrola paketů:** Veškeré matematické výpočty, predikce, kolizní boxy i raycasty běží asynchronně v síťových vláknech Netty, takže nezatěžují hlavní herní vlákno.
- **Stabilní synchronizace ticků:** Časování zůstává svázáno s reálným během herního ticku serveru, což předchází falešným detekcím při propadech TPS nebo lag spikech.

### Jak fungují automatické aktualizace

Každou neděli v 04:00 UTC GitHub Actions automaticky:
1. Stáhne nejnovější kód z `GrimAnticheat/Grim` (větev `2.0`).
2. Nastaví Leaf API a Java 25.
3. Zkompiluje hotový `grimac-leaf.jar`.
4. Nahraje ho do sekce **Releases**.

Nemusíš dělat nic – stačí zapnout notifikace na releases (👁 Watch → Custom → Releases).  
Chceš build hned? Jdi do **Actions → Auto-Sync & Build GrimAC for Leaf → Run workflow**.

</details>
