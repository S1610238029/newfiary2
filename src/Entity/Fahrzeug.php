<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Fahrzeug
 *
 * @ORM\Table(name="fahrzeug")
 * @ORM\Entity
 */
class Fahrzeug
{
    /**
     * @var int
     *
     * @ORM\Column(name="idfahrzeug", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idfahrzeug;

    /**
     * @var string
     *
     * @ORM\Column(name="fahrzeugart", type="string", length=255, nullable=false)
     */
    private $fahrzeugart;

    /**
     * @var string
     *
     * @ORM\Column(name="fahrzeugbezeichnung", type="string", length=255, nullable=false)
     */
    private $fahrzeugbezeichnung;

    /**
     * @var string|null
     *
     * @ORM\Column(name="gesamtkilometer", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $gesamtkilometer;

    public function getIdfahrzeug(): ?int
    {
        return $this->idfahrzeug;
    }

    public function getFahrzeugart(): ?string
    {
        return $this->fahrzeugart;
    }

    public function setFahrzeugart(string $fahrzeugart): self
    {
        $this->fahrzeugart = $fahrzeugart;

        return $this;
    }

    public function getFahrzeugbezeichnung(): ?string
    {
        return $this->fahrzeugbezeichnung;
    }

    public function setFahrzeugbezeichnung(string $fahrzeugbezeichnung): self
    {
        $this->fahrzeugbezeichnung = $fahrzeugbezeichnung;

        return $this;
    }

    public function getGesamtkilometer()
    {
        return $this->gesamtkilometer;
    }

    public function setGesamtkilometer($gesamtkilometer): self
    {
        $this->gesamtkilometer = $gesamtkilometer;

        return $this;
    }


}
