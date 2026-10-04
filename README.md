# GrimAC – Leaf Async Edition (Auto-Sync & Build)

Automatický sestavovací repozitář pro **[GrimAC](https://github.com/GrimAnticheat/Grim)** s nativní podporou **Leaf API & Folia Async Schedulers** pro síť **MYCHAL SMP**.

## 🚀 Jak to funguje

Tento repozitář nevyžaduje žádnou manuální údržbu. Pomocí **GitHub Actions** se každý týden automaticky:
1. Stáhne nejnovější kód z oficiálního upstreamu `GrimAnticheat/Grim` (větev `2.0`).
2. Aplikuje patch pro automatickou detekci **Leaf serveru** jako asynchronní platformy.
3. Aktivuje **Folia/Leaf Async Schedulers** (`Bukkit.getAsyncScheduler()`) a vláknově bezpečné souběžné cachování chunků/bloků.
4. Zkompiluje hotový plugin `grimac-bukkit.jar`.
5. Publikuje nejnovější JAR do záložky **[Releases](https://github.com/mychalVidea/grimac-leaf/releases)**.

## ⚡ Proč Async na Leaf API?

Standardní GrimAC při běhu na Leafu (který není Folia, ale Paper fork s Folia/Async jádrem) detekuje obyčejný Bukkit a běží v hlavním synchronním vlákně. S tímto patchem:
- **Plný offload z hlavního vlákna:** Všechny tick-end kalkulace a checky běží plně asynchronně přes `Bukkit.getAsyncScheduler()`.
- **Zero TPS Impact:** Žádné záseky hlavního ticku serveru ani při masivním počtu hráčů a packetů.
- **Concurrent Chunk Safety:** Využívá `ConcurrentHashMap` namísto standardních Bukkit struktur.

## 📥 Stažení nejnovějšího buildu

Nejnovější zkompilovaný JAR najdeš vždy v záložce:
👉 **[Releases / latest-leaf-build](https://github.com/mychalVidea/grimac-leaf/releases/tag/latest-leaf-build)**

## 🔄 Ruční spuštění sestavení

Kdykoliv vývojáři GrimAC vydají nový update a nechceš čekat na nedělní automatické sestavení:
1. Přejdi do záložky **Actions**.
2. Vyber workflow **Auto-Sync & Build GrimAC for Leaf**.
3. Klikni na **Run workflow** -> zelené tlačítko **Run workflow**.
4. Za 2–3 minuty máš v Releases nový čerstvý JAR.
