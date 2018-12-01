<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use App\Entity\Logbuch;
use Symfony\Component\HttpFoundation\Request;


class NewEntryController extends AbstractController
{


    //build Einsatzform
    private function buildForm_Einsatz($entry) {

        return $this->createFormBuilder($entry)


            ->add('unterkategorie', ChoiceType::class, [
                'choices' => array_flip(Logbuch::getUnterKategorieOptions_Einsatz())
            ])
             //beim technischen einsatz gibts ne unterunterkategorie
                ->add('unterunterkategorie', ChoiceType::class, [
                    'choices' => array_flip(Logbuch::getUnterKategorien_TechEinsatz())
                ])
            //wenn unterkategorie==brandeinsatz
            ->add('brandausDate', DateType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
                'data' => new \DateTime("now")
                ))
            ->add('brandausTime', TimeType::class, array(
            // renders it as a single text box
            'widget' => 'single_text',
        ))
            ->add('brandwacheStartDate', DateType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
                'data' => new \DateTime("now")
            ))
            ->add('brandwacheStartTime', TimeType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
            ))
            ->add('brandwacheEndeDate', DateType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
                'data' => new \DateTime("now")
            ))
            ->add('brandwacheEndeTime', TimeType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
            ))
            ->add('brandausmass', ChoiceType::class, array(
                'choices' => array_flip(Logbuch::getBrandausmassOptions()),
                'multiple'=>false,
                'expanded'=>true
            ))
            ->add('brandobjekte', TextType::class)
            //wenn unterkategorie==brandsicherheitswache
            ->add('anlass', ChoiceType::class, array(
                'choices'=>array('brandgefährliche Tätigkeit'=>'brandgefährliche Tätigkeit','bei Veranstaltung'=>'bei Veranstaltung'),
                'multiple'=>false,
                'expanded'=>true
            ))
            ->add('strasse', TextType::class)
            ->add('hausnummer', TextType::class)
            ->add('plz', NumberType::class)
            ->add('ort', TextType::class)
            ->add('alarmdatum', DateType::class, array(
                // renders it as a single text box
                'widget' => 'single_text',
                'data' => new \DateTime("now")
            ))
            ->add('alarmzeit', TimeType::class, array(
                // renders it as a single text box
                'widget' => 'single_text'
            ))
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
            ->add('lagebeimEintreffen', TextareaType::class)
            ->add('beschreibung', TextareaType::class)
            ->add('geschaedigterName', TextType::class)
            ->add('geschaedigterAdresse', TextType::class)
            ->add('geschaedigterTel', TextType::class)
            ->add('geschaedigterKennzeichen', TextType::class)
            ->add('eingesetzteGeraete', TextType::class)
            ->add('wetter', ChoiceType::class, array(
                'choices' => array_flip(Logbuch::getWetterOptions()),
                'multiple'=>true,
                'expanded'=>true,
            ))
            ->add('anwesend', ChoiceType::class, array(
                'choices'=>array('BH'=>'Bezirkshauptmannschaft','EVU'=>'EVU','Polizei'=>'Polizei','Straßenverwaltung'=>'Straßenverwaltung',
                    'BFKDT/AFKDT'=>'BFKDT/AFKDT', 'Gemeinde'=>'Gemeinde', 'Rettung'=>'Rettung', 'Wasserwerk'=>'Wasserwerk', 'Sonstige'=>'Sonstige'),
                'multiple'=>true,
                'expanded'=>true,
            ))
            ->add('betriebsmittel', TextType::class)
            ->add('notizen', TextareaType::class)
            ->add('bericht', TextareaType::class)
            ->add('uebungsleiter', TextType::class)
            ->add('save', SubmitType::class)
            ->getForm();
    }

    /**
     * @Route("/newentry", name="newentry")
     */
    public function index(Request $request)
    {

        $neuereinsatz = new Logbuch();
        $neuereinsatz->setKategorie('einsatz');
        $user = $this->get('security.token_storage')->getToken()->getUser();
        $userId = $user->getId();
        echo ($userId);

        $neuereinsatz->setIdbenutzerBenutzer($userId);
        $form_einsatz = $this->buildForm_Einsatz($neuereinsatz);


        $form_einsatz->handleRequest($request);

        if ($form_einsatz->isSubmitted() && $form_einsatz->isValid()) {

            $neuereinsatz = $form_einsatz->getData();

            $em = $this->getDoctrine()->getManager();
            $em->persist($neuereinsatz);
            $em->flush();

            return $this->redirectToRoute('homepage');

        }

        return $this->render('new_entry/Test_newentry.html.twig', [
            'form_einsatz' => $form_einsatz->createView(),

        ]);




        /*  return $this->render('new_entry/newentry.html.twig', [
              'controller_name' => 'NewEntryController',
          ]);*/
    }




}
