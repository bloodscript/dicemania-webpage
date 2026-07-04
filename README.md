# DiceMania Homepage

Statische Website für DiceMania: Spielbeschreibung, Impressum und
Datenschutzerklärung. Reines HTML/CSS/JS ohne Build-Schritt, ausgeliefert als
Container — kein App-Server, keine externen Requests (Schriftarten,
Analyse-Dienste, CDNs) innerhalb der Seiten selbst.

## Dateien

- `index.html` — Startseite: Spielprinzip, Features, Unterstützung
- `impressum.html` — Impressum gemäß § 5 TMG
- `datenschutz.html` — Datenschutzerklärung für Website und App
- `styles.css` — gesamtes Styling inkl. Dark Theme und responsivem Layout
- `script.js` — mobiles Menü, Scroll-Reveal-Animation, Jahr im Footer
- `favicon.svg` — Würfel-Favicon
- `Dockerfile` / `docker-compose.yml` / `nginx.conf` — der Container

## Inhalte bearbeiten

Die Inhalte stehen direkt in den jeweiligen `.html`-Dateien — kein Templating,
kein Build-Schritt nötig. Alle drei Seiten teilen sich `styles.css` und
`script.js` sowie denselben Footer mit den Links zu Impressum und
Datenschutz.

Nach jeder Änderung das Image neu bauen (siehe unten) — es gibt kein Live
Reload.

## Ausführen (immer über den Container)

```bash
docker compose up -d --build
```

Baut ein `nginxinc/nginx-unprivileged:alpine`-Image mit den Seiten (non-root,
gehärtete Response-Header, gzip, langfristiges Caching für CSS/JS/SVG — siehe
`nginx.conf`) und startet es auf `localhost:8080`.

```bash
curl -I http://localhost:8080
```

sollte `200 OK` liefern. `http://localhost:8080` im Browser öffnen.

Stoppen mit:

```bash
docker compose down
```

Port über die Umgebungsvariable `PORT` überschreiben (Standard: 8080):

```bash
PORT=8090 docker compose up -d --build
```

## Deployment auf einem VPS

1. Docker + Compose-Plugin auf dem VPS installieren.
2. Diesen Ordner auf den Server kopieren und `docker compose up -d --build`
   ausführen. Der Container lauscht auf `127.0.0.1:8080` (bzw. dem gesetzten
   `PORT`) — er ist nicht dafür gedacht, direkt ins Internet exponiert zu
   werden.
3. Einen Reverse Proxy für HTTPS davorsetzen, z. B.:

   **nginx (Host) + Certbot**

   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;
       location / {
           proxy_pass http://127.0.0.1:8080;
           proxy_set_header Host $host;
       }
   }
   ```

   ```bash
   sudo certbot --nginx -d yourdomain.com
   ```

   **Caddy** (HTTPS automatisch, kein Certbot nötig)

   ```
   yourdomain.com {
       reverse_proxy 127.0.0.1:8080
   }
   ```

4. Vor der Zertifikatsanforderung einen DNS-A-Record auf den VPS setzen.

## Hinweise

- Kontakt läuft ausschließlich über `mailto:`-Links — kein Formular-Backend
  zu pflegen.
- Respektiert `prefers-reduced-motion`: die Scroll-Reveal-Animation entfällt
  vollständig, wenn das angefordert wird.
- Keine externen Schriftarten oder Skripte — alles wird aus den im Image
  gebackenen Dateien ausgeliefert.
- Der Container läuft als Non-Root-User (`nginx-unprivileged`) und liefert
  ausschließlich statische Dateien aus — keine Shell, kein Interpreter, kein
  beschreibbarer App-Code darin.
- Impressum/Datenschutz spiegeln den aktuellen, nicht-kommerziellen
  Entwicklungsstand von DiceMania wider (kein Nutzerkonto, keine Werbung,
  keine Tracking-Dienste). Bei Änderungen an Datenerhebung oder rechtlicher
  Struktur (z. B. Gewerbeanmeldung, USt-ID) müssen beide Seiten aktualisiert
  werden.
