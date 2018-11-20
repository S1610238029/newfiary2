<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Feed;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

class FeedController extends AbstractController
{
    /**
     * @Route("/schwarzes_brett", name="blackboard")
     */
    public function blackboardAction()
    {
        $rep = $this->getDoctrine()->getRepository(Feed::class);
        $feeds = $rep->findAll();

        return $this->render('pages/blackboard.html.twig', [
            'feeds' => $feeds,
        ]);
    }

    private function buildForm($feed) {

        return $this->createFormBuilder($feed)
            ->add('title', TextType::class)
            ->add('feed', TextareaType::class)
            ->add('save', SubmitType::class)
            ->getForm();
    }

    /**
     * @Route("/schwarzes_brett/neu", name="blackboard_neu")
     */
    public function newFeed(Request $request)
    {
        $feed = new Feed();
        $form = $this->buildForm($feed);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $feed = $form->getData();

            $em = $this->getDoctrine()->getManager();
            $em->persist($feed);
            $em->flush();

            return $this->redirectToRoute('blackboard');

        }

        return $this->render('pages/blackboard_neu.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}

