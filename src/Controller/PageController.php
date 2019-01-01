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
use App\Entity\Logbuch;


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
        $em = $this->getDoctrine()->getManager();

        $repository =  $em->getRepository(Logbuch::class);

        $lastDayofYear=date('Y') . '-12-31';
        $firstDayofYear=date('Y') . '-01-01';
        $year=date('Y');
        $lastDayofYearBefore=date('Y')-1 . '-12-31';
        $firstDayofYearBefore=date('Y')-1 . '-01-01';

        $einsätze=$repository->createQueryBuilder('fc')
         ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum)')
        ->setParameter('kategorie', 'einsatz')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
         ->select('COUNT(fc.idlogbuch) as einsaetze')
         ->getQuery()
         ->getSingleScalarResult();

        $übungen=$repository->createQueryBuilder('fc')
            ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum)')
            ->setParameter('kategorie', 'übung')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('COUNT(fc.idlogbuch) as uebungen')
            ->getQuery()
            ->getSingleScalarResult();

        $brandeinsatz=$repository->createQueryBuilder('fc')
            ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum) and fc.unterkategorie = :unterkategorie')
            ->setParameter('kategorie', 'einsatz')
            ->setParameter('unterkategorie', '0')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('COUNT(fc.idlogbuch) as brandeinsatz')
            ->getQuery()
            ->getSingleScalarResult();

        $brandsicherheitswache=$repository->createQueryBuilder('fc')
            ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum) and fc.unterkategorie = :unterkategorie')
            ->setParameter('kategorie', 'einsatz')
            ->setParameter('unterkategorie', '1')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('COUNT(fc.idlogbuch) as brandsicherheitswache')
            ->getQuery()
            ->getSingleScalarResult();

        $technischer=$repository->createQueryBuilder('fc')
            ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum) and fc.unterkategorie = :unterkategorie')
            ->setParameter('kategorie', 'einsatz')
            ->setParameter('unterkategorie', '2')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('COUNT(fc.idlogbuch) as technischer')
            ->getQuery()
            ->getSingleScalarResult();

        $tätigkeiten=$repository->createQueryBuilder('fc')
            ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum)')
            ->setParameter('kategorie', 'tätigkeit')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('COUNT(fc.idlogbuch) as taetigkeiten')
            ->getQuery()
            ->getSingleScalarResult();

        $einsätze_last=$repository->createQueryBuilder('fc')
            ->andWhere('fc.kategorie = :kategorie and (fc.beginnDatum BETWEEN :startdatum AND :enddatum)')
            ->setParameter('kategorie', 'einsatz')
            ->setParameter('enddatum', $lastDayofYearBefore)
            ->setParameter('startdatum', $firstDayofYearBefore)
            ->select('COUNT(fc.idlogbuch) as einsaetze_last')
            ->getQuery()
            ->getSingleScalarResult();

        $gesamt=$repository->createQueryBuilder('fc')
            ->andWhere('(fc.beginnDatum BETWEEN :startdatum AND :enddatum)')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('COUNT(fc.idlogbuch) as gesamt')
            ->getQuery()
            ->getSingleScalarResult();


        if($einsätze>0){
            $brandeinsatz=$brandeinsatz/$einsätze*100;
            $technischer=$technischer/$einsätze*100;
            $brandsicherheitswache=$brandsicherheitswache/$einsätze*100;
        }else{
            $brandeinsatz=0;
            $technischer=0;
            $brandsicherheitswache=0;
        }

        return $this->render('pages/statistiken.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
            'einsaetze'=> $einsätze,
            'year'=>$year,
            'lastyear'=>$year-1,
            'einsaetze_last'=>$einsätze_last,
            'gesamt'=>$gesamt,
            'uebungen'=>$übungen,
            'taetigkeiten'=>$tätigkeiten,
            'brandeinsatz'=>$brandeinsatz,
            'technischer'=>$technischer,
            'brandsicherheitswache'=>$brandsicherheitswache,

        ]);
    }

    /**
     * @Route("/eintraege", name="entries")
     */
    public function entryAction(Request $request)
    {

        $em = $this->getDoctrine()->getManager();

        $repository =  $em->getRepository(Logbuch::class);
        //$allFeeds =  $em->getRepository(Logbuch::class)->findBy();

        $rep = $this->getDoctrine()->getRepository(Logbuch::class);
      //  $eintraege = $rep->findAll();

        $lastDayofYear=date('Y') . '-12-31';
        $firstDayofYear=date('Y') . '-01-01';
        $year=date('Y');

        $eintraege=$repository->createQueryBuilder('fc')
            ->andWhere('(fc.beginnDatum BETWEEN :startdatum AND :enddatum)')
            ->setParameter('enddatum', $lastDayofYear)
            ->setParameter('startdatum', $firstDayofYear)
            ->select('fc.idlogbuch, fc.beginnDatum, fc.beschreibung, fc.kategorie, fc.unterkategorie, fc.strasse, fc.hausnummer')
            ->getQuery()
            ->getResult();





        return $this->render('pages/entryOverview.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
            'eintraege'=> $eintraege,
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
