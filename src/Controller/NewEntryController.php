<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use App\Entity\Logbuch;

class NewEntryController extends AbstractController
{
    /**
     * @Route("/newentry", name="newentry")
     */
    public function index()
    {
        return $this->render('new_entry/newentry.html.twig', [
            'controller_name' => 'NewEntryController',
        ]);
    }

    private function buildForm($entry) {

        return $this->createFormBuilder($entry)
            ->add('kategorie', ChoiceType::class, [
                'choices'=>array_flip(Logbuch::getKategorieOptions())
            ])
            ->add('unterkategorie', ChoiceType::class, [
                'choices' => array_flip(Logbuch::getUnterKategorieOptions())
            ])
            ->add('priority', ChoiceType::class, [
                'choices' => array_flip(Logbuch::getKategorieOptions())
            ])
            ->add('status', ChoiceType::class, [
                'choices' => array_flip(Logbuch::getKategorieOptions())
            ])
            ->add('save', SubmitType::class)
            ->getForm();
    }
}
