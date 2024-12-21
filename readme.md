# Projektin uudelleenluonti toisessa ympäristössä

Tämä ohjeistus auttaa luomaan kehitysympäristön omalle koneellesi.

## 1. Asenna Docker ja Docker Compose
- Lataa ja asenna Docker Desktop omalle käyttöjärjestelmällesi (esim. Windows, Mac, Linux). [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Varmista, että Docker Compose on käytössä (Docker Desktop sisältää sen automaattisesti). [Docker Compose](https://docs.docker.com/compose/)

## 2. Kopioi projektin kansio
- Kloonaa projektin GitHub-repositorio komentorivillä:

```bash
git clone https://github.com/opex13/pilviA.git
```
TAI
- Ladata ja siirrä "blog-platform"-hakemisto sijaintiin, johon pääset helposti käsiksi.
  - Varmista, että mukana ovat seuraavat tiedostot:
    - `docker-compose.yml`
    - `db_init` kansio
    - `wordpress` kansio

## 3. Muokkaa hosts-tiedostoa (valinnainen)
- Jos haluat käyttää mukautettua domain-nimeä, lisää seuraavat rivit hosts-tiedostoosi:
  - Windows: `C:\Windows\System32\drivers\etc\hosts`
  - Linux/Mac: `/etc/hosts`

```plaintext
127.0.0.1 myblog.local
```

- Tämä vaihe ei ole pakollinen, sillä voit käyttää myös osoitetta `http://localhost`.

## 4. Käynnistä palvelut
- Avaa terminaali tai komentokehote.
- Siirry projektihakemistoon, jossa `docker-compose.yml` sijaitsee.
- Suorita seuraava komento:

```bash
docker-compose up --build
```

- Tämä käynnistää kaikki määritetyt palvelut, kuten WordPressin ja tukipalvelut.

## 5. Avaa selaimessa
- Kun palvelut ovat käynnissä, avaa selain ja siirry seuraavaan osoitteeseen:
  - `http://myblog.local` (jos lisäsit domain-nimen hosts-tiedostoon)
  - `http://localhost` (jos et muokannut hosts-tiedostoa).

- Voit kirjautua WordPress-järjestelmään osoitteessa:

```
http://myblog.local/wp-admin
```

Korvaa `myblog.local` osoitteella `localhost`, jos et tehnyt hosts-muutoksia.

## 6. Muut palvelut ovat saatavilla:


- [http://localhost:8081/](http://localhost:8081/) phpMyAdmin
- [http://localhost:8080/](http://localhost:8080/) Traefik Dashboard

## 7. Palveluiden pysäyttäminen:

Pysäytä palvelut komennolla:

```
docker-compose down
```
Jos haluat poistaa myös tiedostovolumeja (tietokannat, WordPress-tiedostot jne.), käytä:
```
docker-compose down -v
```
## 8. Ympäristön muuttujat ja volyymit:

- `db_data`: MySQL-tietokannan data, alustetaan jokaisen ympäristön käynnistäessä. Tämä voi estää kommentoimalla rivit 42 ja 43 docker-compose.yml tiedostossa:
```
db:
 volumes:
...
# - ./db_init/01_load_timezones.sql:/docker-entrypoint-initdb.d/01_load_timezones.sql
# - ./db_init/02_wordpress_init.sql:/docker-entrypoint-initdb.d/02_init.sql
```

- `./wordpress`: WordPressin tiedostot, kuten teemat ja lisäosat.

### WordPress-palvelu
- `WORDPRESS_DB_HOST`: Määrittää tietokantapalvelimen, johon WordPress yhdistää.
- `WORDPRESS_DB_USER`: Tietokantakäyttäjänimi.
- `WORDPRESS_DB_PASSWORD`: Tietokantakäyttäjän salasana.
- `WORDPRESS_DB_NAME`: Tietokannan nimi.
- `WORDPRESS_CACHE_TYPE`: Varastointityyppi; tässä tapauksessa Redis.
- `WORDPRESS_CACHE_REDIS_HOST`: Redis-varastoinnin palvelin.
- `WORDPRESS_CACHE_REDIS_PORT`: Redis-varastoinnin portti.
- `WORDPRESS_DEBUG`: Aktivoi WordPressin debug-tilan.

### Tietokanta-palvelu (MySQL)
- `MYSQL_ROOT_PASSWORD`: MySQL:n root-käyttäjän salasana.
- `MYSQL_DATABASE`: Luotavan tietokannan nimi.
- `MYSQL_USER`: Luotavan tietokantakäyttäjän nimi.
- `MYSQL_PASSWORD`: Tietokantakäyttäjän salasana.

### phpMyAdmin-palvelu
- `PMA_HOST`: Tietokantapalvelin.
- `PMA_USER`: Tietokantakäyttäjänimi phpMyAdminille.
- `PMA_PASSWORD`: Tietokantakäyttäjän salasana.
---

## Ongelmatilanteissa tarkistettava
Jos kohtaat ongelmia ympäristön pystyttämisessä, tarkista seuraavat asiat:
- Dockerin ja Docker Composen asennukset.
- `docker-compose.yml`-tiedoston rakenne.
- Terminaalin tai komentokehotteen virheilmoitukset.