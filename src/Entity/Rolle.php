<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Rolle
 *
 * @ORM\Table(name="rolle")
 * @ORM\Entity
 */
class Rolle
{
    /**
     * @var int
     *
     * @ORM\Column(name="idrolle", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idrolle;

    /**
     * @var string
     *
     * @ORM\Column(name="rollenname", type="string", length=255, nullable=false, options={"comment"="lookup für fahrzeugbesatzung.rolle"})
     */
    private $rollenname;

    public function getIdrolle(): ?int
    {
        return $this->idrolle;
    }

    public function getRollenname(): ?string
    {
        return $this->rollenname;
    }

    public function setRollenname(string $rollenname): self
    {
        $this->rollenname = $rollenname;

        return $this;
    }


}
