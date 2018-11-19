<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\File;

/**
 * Entity
 *
 * @ORM\Table(name="logbuch")
 * @ORM\Entity
 */
class Entry
{
    /**
     * @var int
     *
     * @ORM\Column(name="idlogbuch", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $idlogbuch;

    /**
     * @OneToMany(targetEntity="EntryKategorie", mappedBy="idcategory", cascade={"ALL"}, indexBy="kategorie")
     */
    protected $kategorie;

    /**
     *
     * @OneToMany(targetEntity="EinsatzArt", mappedBy="ideinsatzart", cascade={"ALL"}, indexBy="unterkategorie")
     */
    protected $unterkategorie;

    /**
     * @var string
     *
     * @Assert\NotBlank()
     * @Assert\Length(
     *      max=4096
     *      maxMessage = "Your description cannot be longer than {{ limit }} characters")
     * @ORM\Column(name="beschreibung", type="string", length=4096)
     */
    protected $beschreibung;


    /**
     * @Assert\DateTime
     *
     * @ORM\Column(name="alarmzeit")
     */
    protected $alarmzeit;

    /**
     * @var string
     *
     * @ORM\Column(name="anforderer_name", type="string", length=255)
     */
    protected $anforderer_name;

    /**
     *
     * @Assert\Regex(
     *     pattern="/^(0|\+)[0-9]/",
     *     message="Please enter a valid phone number"
     * )
     * @ORM\Column(name="anforderer_telefon_nr", type="integer", length=255)
     */
    protected $anforderer_telefon_nr;

    /**
     * @Assert\Date
     *
     * @ORM\Column(name="beginn_datum")
     */
    protected $beginn_datum;

    /**
     * @Assert\Time
     *
     * @ORM\Column(name="beginn_zeit")
     */
    protected $beginn_zeit;

    /**
     * @Assert\Date
     *
     * @ORM\Column(name="ende_datum")
     */
    protected $ende_datum;

    /**
     * @Assert\Time
     *
     * @ORM\Column(name="ende_zeit")
     */
    protected $ende_zeit;

    /**
     * @var int
     *
     * @Assert\Length(
     *     min=4
     *     max=4
     *     exactMessage="This value should have exactly {{ limit }} characters.")
     *
     * @ORM\Column(name="plz", type="integer", length="4")
     */
    protected $plz;


    /**
     * @var string
     *
     * @ORM\Column(name="ort", type="string", length="255")
     */
    protected $ort;

    /**
     * @var string
     *
     * @ORM\Column(name="straße", type="string", length="600")
     */
    protected $straße;

    /**
     * @var string
     *
     * @ORM\Column(name="hausnummer", type="string", length="50")
     */
    protected $hausnummer;

    /**
     * @var string
     *
     * @ORM\Column(name="betriebsmittel", type="string", length="5000")
     */
    protected $betriebsmittel;


    /**
     * @var string
     *
     * @ORM\Column(name="bericht", type="string", length="20000")
     */
    protected $bericht;

    /**
     * @var string
     *
     * @ORM\Column(name="wetter", type="string", length="5000")
     */
    protected $wetter;

    /**
     * @var string
     *
     * @ORM\Column(name="bodenbeschaffenheit", type="string", length="5000")
     */
    protected $bodenbeschaffenheit;

    /**
     * @var string
     *
     * @ORM\Column(name="notizen", type="string", length="5000")
     */
    protected $notizen;

    /**
     * @var int
     *
     * @ORM\Column(name="idbenutzer_benutzer")
     * @OneToMany(targetEntity="IdBenutzer", mappedBy="idbenutzer", cascade={"ALL"}, indexBy="idbenutzer")
     */
    protected $idbenutzer;

    /**
     * @Assert\DateTime
     *
     * @ORM\Column(name="metadata")
     */
    protected $metaData; //current datetime, when entry is entered







    /**
     * @Assert\Image()
     */
    protected $headshot;

    public function setHeadshot(File $file = null)
    {
        $this->headshot = $file;
    }

    public function getHeadshot()
    {
        return $this->headshot;
    }





    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set username
     *
     * @param string $username
     *
     * @return User
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    public function getPlainPassword()
    {
    return $this->plainPassword;
    }

    public function setPlainPassword($password)
    {
        $this->plainPassword = $password;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return User
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set password
     *
     * @param string $password
     *
     * @return User
     */
    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }

    /**
     * Get password
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }


    public function getRoles(){
      return [
        'ROLE_USER'
      ];
    }

    public function getSalt(){
        return null;
    }

    public function eraseCredentials(){}

    public function serialize(){
      return serialize([
        $this->id,
        $this->username,
        $this->email,
        $this->password,
      ]);
    }

    public function unserialize($string){
      list(
        $this->id,
        $this->username,
        $this->email,
        $this->password,
        ) = unserialize($string, ['allowed_classes' => false]);
    }

}
