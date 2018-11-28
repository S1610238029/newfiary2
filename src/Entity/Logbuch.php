<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Logbuch
 *
 * @ORM\Table(name="logbuch", indexes={@ORM\Index(name="idbenutzer_benutzer", columns={"idbenutzer_benutzer"})})
 * @ORM\Entity
 */
class Logbuch
{
    /**
     * @var int
     *
     * @ORM\Column(name="idlogbuch", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idlogbuch;

    /**
     * @var string
     *
     * @ORM\Column(name="kategorie", type="string", length=255, nullable=false)
     */
    private $kategorie;

    /**
     *
     *
     * @ORM\Column(name="unterkategorie", type="integer",  nullable=false)
     */
    private $unterkategorie;

    /**
     * @var string
     *
     * @ORM\Column(name="beschreibung", type="string", length=255, nullable=false)
     */
    private $beschreibung;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="alarmzeit", type="datetime", nullable=false)
     */
    private $alarmzeit;

    /**
     * @var string
     *
     * @ORM\Column(name="anforderer_name", type="string", length=255, nullable=false)
     */
    private $anfordererName;

    /**
     * @var string
     *
     * @ORM\Column(name="anforderer_telefon_nr", type="string", length=255, nullable=false)
     */
    private $anfordererTelefonNr;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="beginn_datum", type="date", nullable=false)
     */
    private $beginnDatum;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="beginn_zeit", type="time", nullable=false)
     */
    private $beginnZeit;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="ende_datum", type="date", nullable=false)
     */
    private $endeDatum;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="ende_zeit", type="time", nullable=false)
     */
    private $endeZeit;

    /**
     * @var int
     *
     * @ORM\Column(name="plz", type="integer", nullable=false)
     */
    private $plz;

    /**
     * @var string
     *
     * @ORM\Column(name="ort", type="string", length=255, nullable=false)
     */
    private $ort;

    /**
     * @var string
     *
     * @ORM\Column(name="strasse", type="string", length=255, nullable=false)
     */
    private $strasse;

    /**
     * @var string
     *
     * @ORM\Column(name="hausnummer", type="string", length=255, nullable=false)
     */
    private $hausnummer;

    /**
     * @var string
     *
     * @ORM\Column(name="betriebsmittel", type="string", length=255, nullable=false)
     */
    private $betriebsmittel;

    /**
     * @var string
     *
     * @ORM\Column(name="bericht", type="text", length=0, nullable=false)
     */
    private $bericht;

    /**
     * @var string|null
     *
     * @ORM\Column(name="wetter", type="string", length=255, nullable=true)
     */
    private $wetter;

    /**
     * @var string|null
     *
     * @ORM\Column(name="bodenbeschaffenheit", type="string", length=255, nullable=true)
     */
    private $bodenbeschaffenheit;

    /**
     * @var string
     *
     * @ORM\Column(name="notizen", type="text", length=0, nullable=false)
     */
    private $notizen;

    /**
     * @var int
     *
     * @ORM\Column(name="idbenutzer_benutzer", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $idbenutzerBenutzer;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="metadata", type="datetime", nullable=false, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $metadata = 'CURRENT_TIMESTAMP';


    public static function getKategorieOptions(){
        return["einsatz", "übung", "tätigkeit"];
    }
    public static function getUnterKategorieOptionsEinsatz(){
        return["Brandeinsatz", "Brandsicherheitswache", "Technischer Einsatz"];
    }


    public function getIdlogbuch(): ?int
    {
        return $this->idlogbuch;
    }

    public function getKategorie(): ?string
    {
        return $this->kategorie;
    }

    public function setKategorie(string $kategorie): self
    {
        $this->kategorie = $kategorie;

        return $this;
    }

    public function getUnterkategorie(): ?string
    {
        return $this->unterkategorie;
    }

    public function setUnterkategorie(string $unterkategorie): self
    {
        $this->unterkategorie = $unterkategorie;

        return $this;
    }

    public function getBeschreibung(): ?string
    {
        return $this->beschreibung;
    }

    public function setBeschreibung(string $beschreibung): self
    {
        $this->beschreibung = $beschreibung;

        return $this;
    }

    public function getAlarmzeit(): ?\DateTimeInterface
    {
        return $this->alarmzeit;
    }

    public function setAlarmzeit(\DateTimeInterface $alarmzeit): self
    {
        $this->alarmzeit = $alarmzeit;

        return $this;
    }

    public function getAnfordererName(): ?string
    {
        return $this->anfordererName;
    }

    public function setAnfordererName(string $anfordererName): self
    {
        $this->anfordererName = $anfordererName;

        return $this;
    }

    public function getAnfordererTelefonNr(): ?string
    {
        return $this->anfordererTelefonNr;
    }

    public function setAnfordererTelefonNr(string $anfordererTelefonNr): self
    {
        $this->anfordererTelefonNr = $anfordererTelefonNr;

        return $this;
    }

    public function getBeginnDatum(): ?\DateTimeInterface
    {
        return $this->beginnDatum;
    }

    public function setBeginnDatum(\DateTimeInterface $beginnDatum): self
    {
        $this->beginnDatum = $beginnDatum;

        return $this;
    }

    public function getBeginnZeit(): ?\DateTimeInterface
    {
        return $this->beginnZeit;
    }

    public function setBeginnZeit(\DateTimeInterface $beginnZeit): self
    {
        $this->beginnZeit = $beginnZeit;

        return $this;
    }

    public function getEndeDatum(): ?\DateTimeInterface
    {
        return $this->endeDatum;
    }

    public function setEndeDatum(\DateTimeInterface $endeDatum): self
    {
        $this->endeDatum = $endeDatum;

        return $this;
    }

    public function getEndeZeit(): ?\DateTimeInterface
    {
        return $this->endeZeit;
    }

    public function setEndeZeit(\DateTimeInterface $endeZeit): self
    {
        $this->endeZeit = $endeZeit;

        return $this;
    }

    public function getPlz(): ?int
    {
        return $this->plz;
    }

    public function setPlz(int $plz): self
    {
        $this->plz = $plz;

        return $this;
    }

    public function getOrt(): ?string
    {
        return $this->ort;
    }

    public function setOrt(string $ort): self
    {
        $this->ort = $ort;

        return $this;
    }

    public function getStrasse(): ?string
    {
        return $this->strasse;
    }

    public function setStrasse(string $strasse): self
    {
        $this->strasse = $strasse;

        return $this;
    }

    public function getHausnummer(): ?string
    {
        return $this->hausnummer;
    }

    public function setHausnummer(string $hausnummer): self
    {
        $this->hausnummer = $hausnummer;

        return $this;
    }

    public function getBetriebsmittel(): ?string
    {
        return $this->betriebsmittel;
    }

    public function setBetriebsmittel(string $betriebsmittel): self
    {
        $this->betriebsmittel = $betriebsmittel;

        return $this;
    }

    public function getBericht(): ?string
    {
        return $this->bericht;
    }

    public function setBericht(string $bericht): self
    {
        $this->bericht = $bericht;

        return $this;
    }

    public function getWetter(): ?string
    {
        return $this->wetter;
    }

    public function setWetter(?string $wetter): self
    {
        $this->wetter = $wetter;

        return $this;
    }

    public function getBodenbeschaffenheit(): ?string
    {
        return $this->bodenbeschaffenheit;
    }

    public function setBodenbeschaffenheit(?string $bodenbeschaffenheit): self
    {
        $this->bodenbeschaffenheit = $bodenbeschaffenheit;

        return $this;
    }

    public function getNotizen(): ?string
    {
        return $this->notizen;
    }

    public function setNotizen(string $notizen): self
    {
        $this->notizen = $notizen;

        return $this;
    }

    public function getIdbenutzerBenutzer(): ?int
    {
        return $this->idbenutzerBenutzer;
    }

    public function setIdbenutzerBenutzer(int $idbenutzerBenutzer): self
    {
        $this->idbenutzerBenutzer = $idbenutzerBenutzer;

        return $this;
    }

    public function getMetadata(): ?\DateTimeInterface
    {
        return $this->metadata;
    }

    public function setMetadata(\DateTimeInterface $metadata): self
    {
        $this->metadata = $metadata;

        return $this;
    }


}
