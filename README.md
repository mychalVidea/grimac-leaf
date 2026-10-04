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

## 📊 Comparison

### Upstream GrimAC vs. This Leaf Build

| Aspect / Feature | Upstream GrimAC (Official) | `grimac-leaf` (This Build) |
|---|---|---|
| **Anticheat Core Logic** | GrimAC 2.0 codebase | **100% identical GrimAC 2.0 logic** (zero check tampering) |
| **Compiled Against** | `io.papermc.paper:paper-api` (1.20.6) | **`cn.dreeam.leaf:leaf-api` (26.3 SNAPSHOT)** |
| **Java Target** | Java 21 | **Java 25 (LTS)** |
| **Leaf 26.x Compatibility** | Runs via legacy compatibility layer | **Directly linked against native Leaf API classes** |
| **Binary Availability** | Must be compiled manually from source | **Pre-built `.jar` in Releases (automated weekly builds)** |
| **Artifact Name** | `grimac-bukkit-{version}.jar` | **`grimac-leaf-{version}.jar`** |

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

### 📊 Porovnání (Upstream GrimAC vs. Tento Leaf build)

| Aspekt / Vlastnost | Upstream GrimAC (Oficiální) | `grimac-leaf` (Tento build) |
|---|---|---|
| **Kód / Logika anticheatu** | GrimAC 2.0 (GrimAnticheat/Grim) | **100% identický kód GrimAC 2.0** (žádné zásahy do detekcí) |
| **Kompilováno proti** | `io.papermc.paper:paper-api` (1.20.6) | **`cn.dreeam.leaf:leaf-api` (26.3 SNAPSHOT)** |
| **Cílová verze Javy** | Java 21 | **Java 25 (LTS)** |
| **Kompatibilita s Leaf 26.x** | Běží přes zpětnou kompatibilitu | **Přímé linkování proti nativním Leaf API třídám** |
| **Dostupnost sestavení** | Nutno kompilovat ručně ze zdrojáků | **Hotový `.jar` ke stažení v Releases (týdenní auto-build)** |
| **Název souboru** | `grimac-bukkit-{verze}.jar` | **`grimac-leaf-{verze}.jar`** |

### Jak fungují automatické aktualizace

Každou neděli v 04:00 UTC GitHub Actions automaticky:
1. Stáhne nejnovější kód z `GrimAnticheat/Grim` (větev `2.0`).
2. Nastaví Leaf API a Java 25.
3. Zkompiluje hotový `grimac-leaf.jar`.
4. Nahraje ho do sekce **Releases**.

Nemusíš dělat nic – stačí zapnout notifikace na releases (👁 Watch → Custom → Releases).  
Chceš build hned? Jdi do **Actions → Auto-Sync & Build GrimAC for Leaf → Run workflow**.

</details>
