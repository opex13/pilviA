# Verkon uudelleenluonti toisessa ympäristössä

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

- Tämä vaihe ei ole pakollinen, sillä voit käyttää myös osoitetta `[http://localhost](http://localhost)`.

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
  - `[http://myblog.local](http://myblog.local)` (jos lisäsit domain-nimen hosts-tiedostoon)
  - `[http://localhost](http://localhost)` (jos et muokannut hosts-tiedostoa).

- Voit kirjautua WordPress-järjestelmään osoitteessa:

```
[http://myblog.local/wp-admin](http://myblog.local/wp-admin)
```

Korvaa `myblog.local` osoitteella `localhost`, jos et tehnyt hosts-muutoksia.

## 6. Muut palvelut ovat saatavilla:


- [http://localhost:8081/](http://localhost:8081/) phpMyAdmin
- [http://localhost:8080/](http://localhost:8080/) Traefik Dashboard


---

## Yhteystiedot ja tuki
Jos kohtaat ongelmia ympäristön pystyttämisessä, tarkista seuraavat asiat:
- Dockerin ja Docker Composen asennukset.
- `docker-compose.yml`-tiedoston rakenne.
- Terminaalin tai komentokehotteen virheilmoitukset.