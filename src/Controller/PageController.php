<?php

namespace App\Controller;

use App\Entity\Feed;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Mitglieder;


class PageController extends Controller //AbstracController
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $allFeeds =  $em->getRepository(Feed::class)->findAll();
        $allDates = [];
        foreach($allFeeds as $feed) {
            $allDates[] = $feed->getDate();
        }

        usort($allDates, function($a, $b) {
            return strtotime($a) - strtotime($b);
        });

        foreach($allFeeds as $feed) {
            if ($feed->getDate() == $allDates[0]){
                $ultimateFeed = $feed;
            }
        }
        // replace this example code with whatever you need
        return $this->render('homepage/index.html.twig', [
            'entry' => $ultimateFeed,
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }


    /**
     * @Route("/pages", name="pages")
     */
    public function pageAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('pages/page.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/statistiken", name="statistics")
     */
    public function statisticAction(Request $request)
    {
        return $this->render('pages/statistiken.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/eintraege", name="entries")
     */
    public function entryAction(Request $request)
    {
        return $this->render('pages/entryOverview.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/info", name="infos")
     */
    public function infoAction(Request $request)
    {
        $rep = $this->getDoctrine()->getRepository(Mitglieder::class);
        $mitglieder = $rep->findAll();

        /**
         * @var $paginator \Knp\Component\Pager\Paginator
         */
        /*    $paginator = $this->get('knp_paginator');
            $result=$paginator->paginate(
                $mitglieder,
                $request->query->getInt('page',1),
                $request->query->getInt('limit',1)
        );*/


        return $this->render('pages/info.html.twig', [
            'mitglieder' => $mitglieder,
        ]);
    }



    /**
     * @Route("/support", name="support")
     */
    public function supportAction(Request $request)
    {
        return $this->render('pages/support.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }


}
