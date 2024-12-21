# Verkon uudelleenluonti toisessa ympäristössä

Tämä ohjeistus auttaa luomaan kehitysympäristön omalle koneellesi.

## 1. Asenna Docker ja Docker Compose
- Lataa ja asenna Docker Desktop omalle käyttöjärjestelmällesi (esim. Windows, Mac, Linux). [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Varmista, että Docker Compose on käytössä (Docker Desktop sisältää sen automaattisesti). [Docker Compose](https://docs.docker.com/compose/)

## 2. Kopioi projektin kansio
- Kloonaa projektin GitHub-repositorio komentorivillä:

```bash
git clone <repository_url>
```
TAI
- Siirrä "blog-platform"-hakemisto sijaintiin, johon pääset helposti käsiksi.
  - Varmista, että mukana ovat ainakin seuraavat tiedostot:
    - `docker-compose.yml`
    - muut mahdolliset projektikonfiguraatiotiedostot.

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

---

## Yhteystiedot ja tuki
Jos kohtaat ongelmia ympäristön pystyttämisessä, tarkista seuraavat asiat:
- Dockerin ja Docker Composen asennukset.
- `docker-compose.yml`-tiedoston rakenne.
- Terminaalin tai komentokehotteen virheilmoitukset.