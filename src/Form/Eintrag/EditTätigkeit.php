<?php

// src/AppBundle/Form/UserType.php
namespace App\Form\Eintrag;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use App\Form\BesetzungsType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use App\Entity\Logbuch;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;


class EditTätigkeit extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $builder
            ->add('unterkategorie', ChoiceType::class, [
                'choices' => array_flip(Logbuch::getUnterKategorieOptions_Tätigkeit()),
                'placeholder'=> 'Wähle eine Unterkategorie'
            ])
            // BEGINN UND ENDE
            ->add('beginnDatum', DateType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
                'data' => new \DateTime("now")
            ))
            ->add('beginnZeit', TimeType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
            ))
            ->add('endeDatum', DateType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
                'data' => new \DateTime("now")
            ))
            ->add('endeZeit', TimeType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
            ))
            ->add('lagebeimEintreffen', TextareaType::class, array(
                'required'=>false
            ))
            ->add('beschreibung', TextareaType::class, array(
                'required'=>false
            ))
            ->add('eingesetzteGeraete', TextType::class, array(
                'required'=>false
            ))
            // ÖRTLICHES
            ->add('strasse', TextType::class)
            ->add('hausnummer', TextType::class)
            ->add('plz', NumberType::class)
            ->add('ort', TextType::class)
            ->add('photo', FileType::class, array(
                'required'=>false
            ))
            /*->add('besatzung', CollectionType::class, array(
                'entry_type' => BesetzungsType::class,
                'allow_add'    => true,
            ));*/
            ->add('submit', SubmitType::class);




    }

    public function getBlockPrefix() {
        return 'createEntry';
    }

    /**
     * {@inheritDoc}
     */
    public function getName() {
        return $this->getBlockPrefixFoto();
    }
    /**
     * {@inheritDoc}
     */
    public function getBlockPrefixFoto() {
        return 'photoUpload';
    }
}
