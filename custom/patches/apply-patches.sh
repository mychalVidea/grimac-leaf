#!/usr/bin/env bash
set -euo pipefail

CUSTOM_DIR="${1:-./custom-repo/custom}"
echo "=========================================================="
echo "  MYCHAL SMP – GrimAC Leaf Customization Pipeline"
echo "  Applying Debloat, Design System & Leaf/Java 25 tuning"
echo "=========================================================="
echo "Custom resources directory: ${CUSTOM_DIR}"

# -------------------------------------------------------------
# 1. DEBLOAT: Vypnutí zbytečných Fabric modulů
# -------------------------------------------------------------
echo "[1/6] Optimalizace sestavení - vypnutí Fabric modulů..."
if [ -f "settings.gradle.kts" ]; then
    sed -i '/include.*fabric/d' settings.gradle.kts
fi

# -------------------------------------------------------------
# 2. DEBLOAT: Odstranění bStats telemetrie
# -------------------------------------------------------------
echo "[2/6] Debloat - odstranění bStats telemetrie..."
LOADER_FILE="bukkit/src/main/java/ac/grim/grimac/platform/bukkit/GrimACBukkitLoaderPlugin.java"
if [ -f "$LOADER_FILE" ]; then
    sed -i 's/new BukkitBStats(),/\/\/ bStats stripped for debloat/g' "$LOADER_FILE"
    echo "  -> bStats úspěšně vyřazen z ${LOADER_FILE}"
fi

# -------------------------------------------------------------
# 3. DEBLOAT: Odstranění zbytečného UpdateCheckeru
# -------------------------------------------------------------
echo "[3/6] Debloat - vyřazení externího UpdateCheckeru..."
UPDATE_CHECKER="common/src/main/java/ac/grim/grimac/manager/init/start/UpdateChecker.java"
if [ -f "$UPDATE_CHECKER" ]; then
    cat << 'EOF' > "$UPDATE_CHECKER"
package ac.grim.grimac.manager.init.start;

public class UpdateChecker implements StartableInitable {
    @Override
    public void start() {
        // Zde neběží žádná kontrola - aktualizace řeší GitHub Actions automaticky
    }
}
EOF
    echo "  -> UpdateChecker vyřazen z ${UPDATE_CHECKER}"
fi

CONFIG_FILE="common/src/main/resources/config/en.yml"
if [ -f "$CONFIG_FILE" ]; then
    sed -i 's/check-for-updates: true/check-for-updates: false/g' "$CONFIG_FILE"
fi

# -------------------------------------------------------------
# 4. DESIGN: Aplikace MYCHAL SMP brandu (bez prefixů, brand barvy)
# -------------------------------------------------------------
echo "[4/6] Design - aplikace MYCHAL SMP brand zpráv..."
CUSTOM_MESSAGES="${CUSTOM_DIR}/messages/en.yml"
if [ -f "$CUSTOM_MESSAGES" ]; then
    mkdir -p common/src/main/resources/messages
    cp "$CUSTOM_MESSAGES" common/src/main/resources/messages/en.yml
    # Přepíšeme i ostatní jazykové soubory, aby se všude použil čistý jednotný design
    for lang_file in common/src/main/resources/messages/*.yml; do
        cp "$CUSTOM_MESSAGES" "$lang_file"
    done
    echo "  -> Brand zprávy úspěšně nasazeny do resources"
fi

# -------------------------------------------------------------
# 5. LEAF API: Napojení na nativní Leaf API
# -------------------------------------------------------------
echo "[5/6] Leaf API - konfigurace maven repository a leaf-api..."
if [ -f "bukkit/build.gradle.kts" ]; then
    sed -i 's|repositories {|repositories {\n    maven("https://maven.leafmc.one/snapshots/")|g' bukkit/build.gradle.kts
    sed -i 's|compileOnly(libs.paper.api)|compileOnly("cn.dreeam.leaf:leaf-api:26.3.local-SNAPSHOT")|g' bukkit/build.gradle.kts
fi

# -------------------------------------------------------------
# 6. JAVA 25: Toolchain a parametry kompilátoru
# -------------------------------------------------------------
echo "[6/6] Java 25 - nastavení toolchainu a UTF-8 kódování..."
for gradle_file in build.gradle.kts common/build.gradle.kts bukkit/build.gradle.kts; do
    if [ -f "$gradle_file" ]; then
        echo "tasks.withType<JavaCompile>().configureEach { options.release.set(25); options.encoding = \"UTF-8\" }" >> "$gradle_file"
        echo "java { toolchain.languageVersion.set(JavaLanguageVersion.of(25)) }" >> "$gradle_file"
    fi
done

echo "=== Všechny úpravy úspěšně aplikovány ==="
