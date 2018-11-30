<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

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
     *
     *
     * @ORM\Column(name="unterunterkategorie", type="integer",  nullable=true)
     */
    private $unterunterkategorie;

    /**
     * @var string
     * @Assert\NotBlank()
     * @ORM\Column(name="beschreibung", type="string", length=255, nullable=false)
     */
    private $beschreibung;

    /**
     * @var string
     * @Assert\NotBlank()
     * @ORM\Column(name="lagebeimEintreffen", type="string", nullable=false)
     */
    private $lagebeimEintreffen;

    /**
     * @var string
     * @Assert\NotBlank()
     * @ORM\Column(name="geschaedigter_name", type="string", length=255, nullable=false)
     */
    private $geschaedigterName;

    /**
     * @var string
     *
     * @ORM\Column(name="geschaedigterAdresse", type="string", length=255, nullable=true)
     */
    private $geschaedigterAdresse;

    /**
     * @var string
     * @Assert\Regex(
     *     pattern="/^(0|\+)[0-9]/",
     *     message="Bitte eine gültige Telefonnummer eingeben"
     * )
     * @ORM\Column(name="geschaedigterTel", type="string", length=255, nullable=true)
     */
    private $geschaedigterTel;

    /**
     * @var string
     *
     * @ORM\Column(name="geschaedigterKennzeichen", type="string", length=255, nullable=true)
     */
    private $geschaedigterKennzeichen;

    /**
     * @var string
     *
     * @ORM\Column(name="anwesend", type="string", length=255, nullable=true)
     */
    private $anwesend;

    /**
     * @var string
     *
     * @ORM\Column(name="brandobjekte", type="string", length=255, nullable=true)
     */
    private $brandobjekte;


    /**
     *
     *
     * @ORM\Column(name="brandausDate", type="date", nullable=true)
     */
    private $brandausDate;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="brandausTime", type="time", nullable=true)
     */
    private $brandausTime;

    /**
     *
     * @ORM\Column(name="brandwacheStartDate", type="date", nullable=true)
     */
    private $brandwacheStartDate;

    /**
     *
     * @ORM\Column(name="brandwacheStartTime", type="time", nullable=true)
     */
    private $brandwacheStartTime;

    /**
     *
     *
     * @ORM\Column(name="brandwacheEndeDate", type="date", nullable=true)
     */
    private $brandwacheEndeDate;

    /**
     *
     *
     * @ORM\Column(name="brandwacheEndeTime", type="time", nullable=true)
     */
    private $brandwacheEndeTime;

    /**
     *
     *
     * @ORM\Column(name="brandausmass", type="integer",  nullable=true)
     */
    private $brandausmass;

    /**
     * @var string
     *
     * @ORM\Column(name="anlass", type="string", length=255, nullable=true)
     */
    private $anlass;

    /**
     *
     *
     * @ORM\Column(name="alarmzeit", type="date")
     */
    private $alarmzeit;

    /**
     *
     *
     * @ORM\Column(name="alarmdatum", type="time")
     */
    private $alarmdatum;


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
     * @var string
     *
     * @ORM\Column(name="eingesetzteGeraete", type="string", length=255, nullable=true)
     */
    private $eingesetzteGeraete;

    /**
     * @var string
     *
     * @ORM\Column(name="notizen", type="text", nullable=true)
     */
    private $notizen;

    /**
     * @var string
     *
     * @ORM\Column(name="uebungsleiter", type="text", nullable=true)
     */
    private $uebungsleiter;

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
    public static function getUnterKategorieOptions_Einsatz(){
        return["Brandeinsatz", "Brandsicherheitswache", "Technischer Einsatz",

            "Atemschutzübung", "Begehung", "Bewerbsübung",
            "Branddienstübung",
            "Chargenschulung",
            "FMD-Schulung",
            "Funkübung",
            "Gesamtübung",
            "Gruppenübung",
            "KHD Übung",
            "Kraftfahrübung",
            "Prüfung AP Atemschutz",
            "Prüfung AP Löscheinsatz",
            "Prüfung AP Technischer Einsatz",
            "Schadstoffübung",
            "Schulung",
            "Sprengdienstübung",
            "Tauchdienstübung",
            "Technische Übung",
            "Vorbereitung AP Atemschutz",
            "Vorbereitung AP Löscheinsatz",
            "Vorbereitung AP Technischer Einsatz",
            "Wasserdienstübung",
            "Zugsübung 1.Zug",
            "Zugsübung 2.Zug",
            "Sonstige Übung",

            "Atemschutz", "Ausbildung", "Beratung der Behörden", "Chargensitzung", "Dienstbesprechung",
            "EDV", "Fahrzeug- und Gerätedienst/Fahrmeister","Fahrzeug- und Gerätedienst/Zeugmeister",
            "Feuerwehrball", "Feuerwehrfest",
            "Feuerwehrmedizinischer Dienst",
            "Inspektion",
            "Kirchgang",
            "Kommandobesprechung",
            "Mitgliederbesprechung",
            "Nachrichtendienst",
            "Öffentlichkeitsarbiet und Dokumentation",
            "Repräsentationen",
            "Schadstoffdienst",
            "Schriftverkehr",
            "Sprengdienst",
            "Strahlenschutzdienst",
            "Tätigkeit im Feuerwehrhaus",
            "Veranstaltungen",
            "Versorgungsdienst",
            "Verwaltungstätigkeiten",
            "Vorbeugender Brandschutz",
            "Vorträge/Schulungen",
            "Wartungsarbeiten",
            "Wasserdienst",
            "Sonstige Tätigkeit"
        ];
    }

    public static function getUnterKategorieOptions_Übung(){
        return["Atemschutzübung", "Begehung", "Bewerbsübung",
            "Branddienstübung",
            "Chargenschulung",
            "FMD-Schulung",
            "Funkübung",
            "Gesamtübung",
            "Gruppenübung",
            "KHD Übung",
            "Kraftfahrübung",
            "Prüfung AP Atemschutz",
            "Prüfung AP Löscheinsatz",
            "Prüfung AP Technischer Einsatz",
            "Schadstoffübung",
            "Schulung",
            "Sprengdienstübung",
            "Tauchdienstübung",
            "Technische Übung",
            "Vorbereitung AP Atemschutz",
            "Vorbereitung AP Löscheinsatz",
            "Vorbereitung AP Technischer Einsatz",
            "Wasserdienstübung",
            "Zugsübung 1.Zug",
            "Zugsübung 2.Zug",
            "Sonstiges"
        ];
    }

    public static function getUnterKategorieOptions_Tätigkeit(){
        return["Atemschutz", "Ausbildung", "Beratung der Behörden", "Chargensitzung", "Dienstbesprechung",
            "EDV", "Fahrzeug- und Gerätedienst/Fahrmeister","Fahrzeug- und Gerätedienst/Zeugmeister",
            "Feuerwehrball", "Feuerwehrfest",
            "Feuerwehrmedizinischer Dienst",
            "Inspektion",
            "Kirchgang",
            "Kommandobesprechung",
            "Mitgliederbesprechung",
            "Nachrichtendienst",
            "Öffentlichkeitsarbiet und Dokumentation",
            "Repräsentationen",
            "Schadstoffdienst",
            "Schriftverkehr",
            "Sprengdienst",
            "Strahlenschutzdienst",
            "Tätigkeit im Feuerwehrhaus",
            "Veranstaltungen",
            "Versorgungsdienst",
            "Verwaltungstätigkeiten",
            "Vorbeugender Brandschutz",
            "Vorträge/Schulungen",
            "Wartungsarbeiten",
            "Wasserdienst",
            "Sonstiges"
        ];
    }

    public static function getUnterKategorien_TechEinsatz(){
        return["Auslaufen von Öl bzw. Treibstoff",
                 "Auspumparbeiten",
                 "Einsätze nach VU",
                 "Hochwassereinsatz",
                 "Insekten-, Bienen-, Wespeneinsätze",
                 "Kanalreinigungsarbeiten",
                 "Retten/Befreien von Menschen",
                 "Retten/Befreien von Tieren",
                 "Straßen reinigen",
                 "Sturmeinsatz",
                 "Unfall mit Schadstoffen",
                 "Unwetter",
                 "Wasserversorgung",
                 "Wasserfüllarbeiten",
                 "Sonstige"
                 ];
    }

    public static function getBrandausmassOptions(){
        return["Großbrand", "Mittelbrand", "Kleinbrand", "Vor Eintreffen gelöscht", "Sonstige"];
    }

    public static function getWetterOptions(){
        return["Bedeckt", "Glatteis", "Nebel", "Schnee", "Wind/Sturm", "Glätte", "Hagel", "Regen", "Sonne", "Sonstiges"];
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

    public function getUnterkategorie(): ?int
    {
        return $this->unterkategorie;
    }

    public function setUnterkategorie(int $unterkategorie): self
    {
        $this->unterkategorie = $unterkategorie;

        return $this;
    }

    public function getUnterunterkategorie(): ?int
    {
        return $this->unterunterkategorie;
    }

    public function setUnterunterkategorie(int $unterunterkategorie): self
    {
        $this->unterunterkategorie = $unterunterkategorie;

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

    public function getBrandobjekte(): ?string
    {
        return $this->brandobjekte;
    }

    public function setBrandobjekte(?string $brandobjekte): self
    {
        $this->brandobjekte = $brandobjekte;

        return $this;
    }



    public function getBrandausmass(): ?int
    {
        return $this->brandausmass;
    }

    public function setBrandausmass(?int $brandausmass): self
    {
        $this->brandausmass = $brandausmass;

        return $this;
    }

    public function getLagebeimEintreffen(): ?string
    {
        return $this->lagebeimEintreffen;
    }

    public function setLagebeimEintreffen(string $lagebeimEintreffen): self
    {
        $this->lagebeimEintreffen = $lagebeimEintreffen;

        return $this;
    }

    public function getGeschaedigterName(): ?string
    {
        return $this->geschaedigterName;
    }

    public function setGeschaedigterName(string $geschaedigterName): self
    {
        $this->geschaedigterName = $geschaedigterName;

        return $this;
    }

    public function getGeschaedigterAdresse(): ?string
    {
        return $this->geschaedigterAdresse;
    }

    public function setGeschaedigterAdresse(?string $geschaedigterAdresse): self
    {
        $this->geschaedigterAdresse = $geschaedigterAdresse;

        return $this;
    }

    public function getGeschaedigterTel(): ?string
    {
        return $this->geschaedigterTel;
    }

    public function setGeschaedigterTel(?string $geschaedigterTel): self
    {
        $this->geschaedigterTel = $geschaedigterTel;

        return $this;
    }

    public function getGeschaedigterKennzeichen(): ?string
    {
        return $this->geschaedigterKennzeichen;
    }

    public function setGeschaedigterKennzeichen(?string $geschaedigterKennzeichen): self
    {
        $this->geschaedigterKennzeichen = $geschaedigterKennzeichen;

        return $this;
    }

    public function getAnwesend(): ?string
    {
        return $this->anwesend;
    }

    public function setAnwesend(?string $anwesend): self
    {
        $this->anwesend = $anwesend;

        return $this;
    }

    public function getEingesetzteGeraete(): ?string
    {
        return $this->eingesetzteGeraete;
    }

    public function setEingesetzteGeraete(?string $eingesetzteGeraete): self
    {
        $this->eingesetzteGeraete = $eingesetzteGeraete;

        return $this;
    }

    public function getAnlass(): ?string
    {
        return $this->anlass;
    }

    public function setAnlass(?string $anlass): self
    {
        $this->anlass = $anlass;

        return $this;
    }

    public function getBrandausDate(): ?\DateTimeInterface
    {
        return $this->brandausDate;
    }

    public function setBrandausDate(?\DateTimeInterface $brandausDate): self
    {
        $this->brandausDate = $brandausDate;

        return $this;
    }

    public function getBrandausTime(): ?\DateTimeInterface
    {
        return $this->brandausTime;
    }

    public function setBrandausTime(?\DateTimeInterface $brandausTime): self
    {
        $this->brandausTime = $brandausTime;

        return $this;
    }

    public function getBrandwacheStartDate(): ?\DateTimeInterface
    {
        return $this->brandwacheStartDate;
    }

    public function setBrandwacheStartDate(?\DateTimeInterface $brandwacheStartDate): self
    {
        $this->brandwacheStartDate = $brandwacheStartDate;

        return $this;
    }

    public function getBrandwacheStartTime(): ?\DateTimeInterface
    {
        return $this->brandwacheStartTime;
    }

    public function setBrandwacheStartTime(?\DateTimeInterface $brandwacheStartTime): self
    {
        $this->brandwacheStartTime = $brandwacheStartTime;

        return $this;
    }

    public function getBrandwacheEndeDate(): ?\DateTimeInterface
    {
        return $this->brandwacheEndeDate;
    }

    public function setBrandwacheEndeDate(?\DateTimeInterface $brandwacheEndeDate): self
    {
        $this->brandwacheEndeDate = $brandwacheEndeDate;

        return $this;
    }

    public function getBrandwacheEndeTime(): ?\DateTimeInterface
    {
        return $this->brandwacheEndeTime;
    }

    public function setBrandwacheEndeTime(?\DateTimeInterface $brandwacheEndeTime): self
    {
        $this->brandwacheEndeTime = $brandwacheEndeTime;

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

    public function getAlarmdatum(): ?\DateTimeInterface
    {
        return $this->alarmdatum;
    }

    public function setAlarmdatum(\DateTimeInterface $alarmdatum): self
    {
        $this->alarmdatum = $alarmdatum;

        return $this;
    }

    public function getUebungsleiter(): ?string
    {
        return $this->uebungsleiter;
    }

    public function setUebungsleiter(?string $uebungsleiter): self
    {
        $this->uebungsleiter = $uebungsleiter;

        return $this;
    }


}
