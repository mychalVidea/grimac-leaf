# GrimAC – Leaf Edition (MYCHAL SMP Custom)

> **Auto-synced & custom-tuned build** of [GrimAnticheat/Grim](https://github.com/GrimAnticheat/Grim) compiled natively against **Leaf API (`cn.dreeam.leaf:leaf-api`) for Minecraft 26.x and Java 25**.  
> Features zero-bloat, debloated telemetries, and seamless alignment with the **MYCHAL SMP Design System**.  
> Automatically monitors upstream Grim commits every 4 hours and rebuilds immediately when changes are detected.

[![Latest Release](https://img.shields.io/github/v/release/mychalVidea/grimac-leaf?label=latest%20build&color=brightgreen)](https://github.com/mychalVidea/grimac-leaf/releases/latest)
[![Auto-Build](https://img.shields.io/github/actions/workflow/status/mychalVidea/grimac-leaf/auto-build.yml?label=auto-build)](https://github.com/mychalVidea/grimac-leaf/actions)

---

## 📥 Download

Always grab the clean, unversioned JAR from the Releases page:  
👉 **[Releases → Latest Build](https://github.com/mychalVidea/grimac-leaf/releases/latest)**  
👉 **Direct download link:** `https://github.com/mychalVidea/grimac-leaf/releases/latest/download/grimac-leaf.jar`

Drop `grimac-leaf.jar` into your server's `plugins/` folder and restart.

---

## ✨ Provedené úpravy & vylepšení (Custom Features)

### 🎨 1. Sladění s designovým systémem MYCHAL SMP
- **🚫 Žádné prefixy:** Veškeré hranaté prefixy (`[GrimAC]` nebo `Grim »`) byly kompletně odstraněny (`prefix: ""`). Zprávy jsou čisté a moderní.
- **🎨 Brand barevná hierarchie:**
  - **Modrá (`#0a67e5`):** Jména hráčů, názvy checků, klíčové hodnoty a interaktivní prvky.
  - **Červená (`#f51515`):** Detekce, anomálie, chyby a varování.
  - **Zelená (`#21DE00`):** Úspěšná potvrzení a zapnutí funkcí.
  - **Šedá (`#94a3b8`):** Běžný doplňkový text a oddělovače.
- **🛡️ Prémiová uzavřenost:** Odstraněn zbytečný technický šum a interní bodové kalkulace z výstupů pro hráče.

### ⚡ 2. Nativní Leaf & Java 25 optimalizace
- **Nativní Leaf API:** Kompilováno a linkováno přímo proti `cn.dreeam.leaf:leaf-api:26.3.local-SNAPSHOT` namísto Paper wrapperu.
- **Java 25 (LTS):** Nastaven kompletní Java 25 toolchain a optimalizace kompilátoru s UTF-8 kódováním pro maximální výkon a nízkou latenci.

### 🧹 3. Debloat (vyčištění zbytečností)
- **🚫 Odstranění bStats:** Třída bStats telemetrie byla ze zavaděče pluginu zcela odstraněna. Žádné odesílání dat na externí servery ani zbytečná vlákna.
- **🚫 Odstranění UpdateCheckeru:** Vypnuta kontrola verzí pingající upstream GitHub/Spigot, která na vlastním buildu vyvolávala falešná varování v konzoli.
- **⚡ Odstranění Fabric modulů:** Vypnuty nepoužívané Fabric moduly v Gradle sestavení pro rychlejší kompilaci a čistší výsledný artefakt.

---

## 📊 Porovnání (Upstream GrimAC vs. Tento Custom Leaf Build)

| Aspekt / Vlastnost | Upstream GrimAC (Oficiální) | `grimac-leaf` (Tento Custom Build) |
|---|---|---|
| **Zprávy & UI Prefix** | `&bGrim &8» ...` | **Čisté bez prefixu**, barvy `#0a67e5`, `#f51515`, `#94a3b8` |
| **Telemetrie (bStats)** | Aktivní (odesílá data) | **Zcela odstraněno (Debloated)** |
| **Update Checker** | Pingá Spigot/GitHub | **Deaktivováno** (aktualizace řídí GitHub Actions) |
| **Kompilováno proti** | `io.papermc.paper:paper-api` (1.20.6) | **`cn.dreeam.leaf:leaf-api` (26.3 SNAPSHOT)** |
| **Cílová verze Javy** | Java 21 | **Java 25 (LTS)** |
| **Kompatibilita s Leaf 26.x**| Přes zpětnou kompatibilitu | **Přímé linkování proti nativním Leaf API třídám** |
| **Název souboru** | `grimac-bukkit-{verze}.jar` | **`grimac-leaf.jar`** (čistý název bez čísel) |
| **Dostupnost sestavení** | Ruční kompilace | **Automatický build každé 4 hodiny při změně upstreamu** |

---

## 🔄 Jak fungují automatické aktualizace

Každé **4 hodiny** GitHub Actions automaticky:
1. Zkontroluje přes GitHub API nejnovější commit na větvi `2.0` v `GrimAnticheat/Grim`.
2. Pokud žádná změna neproběhla, kontrola skončí za 2 sekundy.
3. Jakmile Grim vydá nový commit nebo release:
   - Stáhne kód Grimu a aplikuje debloat, designový systém a Leaf API.
   - Zkompiluje hotový čistý `grimac-leaf.jar` pod Java 25.
   - Smaže staré verze a tagy z Releases.
   - Vytvoří nový release **GrimAC Leaf** s trvalým odkazem.

Chceš build hned? Jdi do **Actions → Auto-Sync & Build GrimAC for Leaf → Run workflow**.
