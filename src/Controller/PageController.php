<?php

namespace App\Controller;

use App\Entity\Feed;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Mitglieder;
use App\Entity\Haus;


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

        $repo=$this->getDoctrine()->getRepository(Haus::class);
        $häuser = $repo->findAll();

        return $this->render('pages/info.html.twig', [
            'mitglieder' => $mitglieder,
            'haeuser'=>$häuser,
        ]);
    }

    /**
     * @Route("/info/newhaus", name="newhaus")
     */
    public function newHausAction(Request $request)
    {
        $this->denyAccessUnlessGranted('ROLE_REGISTERED', null, 'Unable to access this page!');
        $row = 1;
        if (($handle = fopen("Häuserliste.csv", "r")) !== FALSE) {
            while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
                $num = count($data);
                echo "<p> $num Felder in Zeile $row: <br /></p>\n";
                $row++;
                $haus = new Haus();
                $haus->setStrasse($data[0]);
                $haus->setHausNr($data[1]);
                //encode the names of bewohner
                $bewohner=base64_encode($data[2]);
                //for decoding: base64_decode(base64_encode($string)):
                $haus->setBewohner($bewohner);
              for ($c=0; $c < $num; $c++) {
                    echo $data[$c] . "<br />\n";


                }
                $em = $this->getDoctrine()->getManager();
                $em->persist($haus);
                $em->flush();
            }
            fclose($handle);
        }



        return new Response(
            '<html><body>Häuserliste wurde upgedatet!</body></html>'
        );
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


    /**
     * @Route("/datenschutz", name="datenschutz")
     */
    public function datenschutzAction(Request $request)
    {
        return $this->render('pages/datenschutz.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }


}
