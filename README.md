# DiceMania Homepage

Statische Website für DiceMania: Spielbeschreibung, Impressum und
Datenschutzerklärung. Reines HTML/CSS/JS ohne Build-Schritt, gehostet über
GitHub Pages direkt aus diesem Repository — kein Server, kein
Build-Prozess, keine externen Requests (Schriftarten, Analyse-Dienste,
CDNs) innerhalb der Seiten selbst.

## Dateien

- `index.html` — Startseite: Spielprinzip, Features, Unterstützung
- `impressum.html` — Impressum gemäß § 5 TMG
- `datenschutz.html` — Datenschutzerklärung für Website und App
- `styles.css` — gesamtes Styling inkl. Farbpalette und responsivem Layout
- `script.js` — mobiles Menü, Scroll-Reveal-Animation, Jahr im Footer
- `favicon.svg` — Würfel-Favicon im App-Farbschema
- `fonts/Baloo2-ExtraBold.ttf` + `fonts/OFL.txt` — dieselbe Display-Schrift
  wie in der App (nur für Überschriften/Logo, siehe unten), selbst gehostet
  statt von einem Font-CDN geladen
- `.nojekyll` — verhindert, dass GitHub Pages die Seiten durch Jekyll
  vorverarbeitet (nicht nötig für reines statisches HTML, vermeidet aber
  Überraschungen bei Dateien/Ordnern mit führendem Unterstrich)

## Design

Farben und Schrift sind bewusst 1:1 aus dem App-Theme übernommen
(`DiceMania v2/lib/ui/theme/app_theme.dart` und `semantic_colors.dart`),
damit Website und App wie derselbe Ort wirken:

- Terrakotta `#c2693d` als Akzentfarbe (App: `buttonAccentColor`)
- Warmer Pergament-Hintergrund `#f3ecdc` (App: `_lightScaffoldBackground`)
- Espresso-Braun `#2a2420` als Textfarbe (App: `_darkScaffoldBackground`,
  hier als Fließtext-auf-hell-Pendant wiederverwendet)
- Gold- und Salbei-Töne als zurückhaltende Zweitakzente an einzelnen Icons
  (abgeleitet von `SemanticColors.marker`/`success`)
- Baloo 2 nur für `h1`/`h2` und das Logo — Fließtext bleibt bei der
  System-Schrift, genau wie in der App bewusst nur Zahlen/Titel die
  Display-Schrift bekommen

Es gibt absichtlich kein Dark-Theme für die Website: "Pastellfarben,
Terrakotta, unaufgeregt und natürlich" beschreibt eine einzige, helle
Stimmung — kein Umschalten nötig.

## Inhalte bearbeiten

Die Inhalte stehen direkt in den jeweiligen `.html`-Dateien — kein
Templating, kein Build-Schritt nötig. Alle drei Seiten teilen sich
`styles.css` und `script.js` sowie denselben Footer mit den Links zu
Impressum und Datenschutz.

Änderungen werden nach einem `git push` auf den `main`-Branch automatisch
von GitHub Pages übernommen (üblicherweise innerhalb weniger Minuten).

## Lokale Vorschau

Kein Build-Schritt nötig, ein einfacher lokaler Webserver reicht:

```bash
python -m http.server 8000
```

Anschließend `http://localhost:8000` im Browser öffnen.

## Hinweise

- Kontakt läuft ausschließlich über `mailto:`-Links — kein Formular-Backend
  zu pflegen.
- Respektiert `prefers-reduced-motion`: die Scroll-Reveal-Animation entfällt
  vollständig, wenn das angefordert wird.
- Keine externen Schriftarten oder Skripte — Baloo 2 liegt lokal unter
  `fonts/` (OFL-Lizenztext liegt daneben, wie von der Lizenz gefordert).
- GitHub Pages liefert diese Seiten ohne eigene Konfigurationsmöglichkeit für
  Response-Header aus (kein Äquivalent zu den früheren nginx-Sicherheits-Headern
  aus der Docker-Variante) — das ist eine Einschränkung von GitHub Pages, nicht
  dieses Projekts.
- Impressum/Datenschutz spiegeln den aktuellen, nicht-kommerziellen
  Entwicklungsstand von DiceMania wider (kein Nutzerkonto, keine Werbung,
  keine Tracking-Dienste). Bei Änderungen an Datenerhebung oder rechtlicher
  Struktur (z. B. Gewerbeanmeldung, USt-ID) müssen beide Seiten aktualisiert
  werden.
