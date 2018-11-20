<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Fahrzeugbesatzung
 *
 * @ORM\Table(name="fahrzeugbesatzung", indexes={@ORM\Index(name="idlogbuch_logbuch", columns={"idlogbuch_logbuch"}), @ORM\Index(name="idfahrzeug_fahrzeug", columns={"idfahrzeug_fahrzeug"}), @ORM\Index(name="idmitglieder_mitglieder", columns={"idmitglieder_mitglieder"})})
 * @ORM\Entity
 */
class Fahrzeugbesatzung
{
    /**
     * @var int
     *
     * @ORM\Column(name="idlogbuch_logbuch", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idlogbuchLogbuch;

    /**
     * @var int
     *
     * @ORM\Column(name="idfahrzeug_fahrzeug", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idfahrzeugFahrzeug;

    /**
     * @var int
     *
     * @ORM\Column(name="idmitglieder_mitglieder", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idmitgliederMitglieder;

    /**
     * @var string
     *
     * @ORM\Column(name="rolle", type="string", length=255, nullable=false)
     */
    private $rolle;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="atemschutz", type="boolean", nullable=true)
     */
    private $atemschutz;

    public function getIdlogbuchLogbuch(): ?int
    {
        return $this->idlogbuchLogbuch;
    }

    public function getIdfahrzeugFahrzeug(): ?int
    {
        return $this->idfahrzeugFahrzeug;
    }

    public function getIdmitgliederMitglieder(): ?int
    {
        return $this->idmitgliederMitglieder;
    }

    public function getRolle(): ?string
    {
        return $this->rolle;
    }

    public function setRolle(string $rolle): self
    {
        $this->rolle = $rolle;

        return $this;
    }

    public function getAtemschutz(): ?bool
    {
        return $this->atemschutz;
    }

    public function setAtemschutz(?bool $atemschutz): self
    {
        $this->atemschutz = $atemschutz;

        return $this;
    }


}
