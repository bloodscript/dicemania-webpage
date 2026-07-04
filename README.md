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
- `styles.css` — gesamtes Styling inkl. Dark Theme und responsivem Layout
- `script.js` — mobiles Menü, Scroll-Reveal-Animation, Jahr im Footer
- `favicon.svg` — Würfel-Favicon
- `.nojekyll` — verhindert, dass GitHub Pages die Seiten durch Jekyll
  vorverarbeitet (nicht nötig für reines statisches HTML, vermeidet aber
  Überraschungen bei Dateien/Ordnern mit führendem Unterstrich)

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
- Keine externen Schriftarten oder Skripte.
- GitHub Pages liefert diese Seiten ohne eigene Konfigurationsmöglichkeit für
  Response-Header aus (kein Äquivalent zu den früheren nginx-Sicherheits-Headern
  aus der Docker-Variante) — das ist eine Einschränkung von GitHub Pages, nicht
  dieses Projekts.
- Impressum/Datenschutz spiegeln den aktuellen, nicht-kommerziellen
  Entwicklungsstand von DiceMania wider (kein Nutzerkonto, keine Werbung,
  keine Tracking-Dienste). Bei Änderungen an Datenerhebung oder rechtlicher
  Struktur (z. B. Gewerbeanmeldung, USt-ID) müssen beide Seiten aktualisiert
  werden.
