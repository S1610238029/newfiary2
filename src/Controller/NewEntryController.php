<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

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
}
