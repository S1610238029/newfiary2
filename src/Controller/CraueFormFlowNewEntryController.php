<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use App\Entity\Logbuch;
use App\Entity\Haus;
use App\Entity\User;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Choice;


class CraueFormFlowNewEntryController extends Controller
{

    /**
     * @Route("/newcraueentry", name="newcraueentry")
     */
    public function createEntryAction() {
        $formData = new Logbuch(); // Your form data class. Has to be an object, won't work properly with an array.

        $user = $this->get('security.token_storage')->getToken()->getUser();
        $userId = $user->getId();
        //echo ($userId);

        $formData->setIdbenutzerBenutzer($userId);

        $flow = $this->get('app.form.flow.createEntry'); // must match the flow's service id
        $flow->bind($formData);

        $repo=$this->getDoctrine()->getRepository(Haus::class);
        $häuser = $repo->findAll();

        // form of the current step
        $form = $flow->createForm();
        if ($flow->isValid($form)) {
            $flow->saveCurrentStepData($form);

            if ($flow->nextStep()) {
                // form for the next step
                $form = $flow->createForm();
            } else {
                // flow finished
                $em = $this->getDoctrine()->getManager();
                $em->persist($formData);
                $em->flush();

                $flow->reset(); // remove step data from the session


                return $this->redirectToRoute('homepage'); // redirect when done
            }
        }
        if ($flow->redirectAfterSubmit($form)) {
            $request = $this->get('request_stack')->getCurrentRequest();
            $params = $this->get('craue_formflow_util')->addRouteParameters(array_merge($request->query->all(),
                $request->attributes->get('_route_params')), $flow);
            return $this->redirect($this->generateUrl($request->attributes->get('_route'), $params));
        }

        return $this->render('Entry/createEntry.html.twig', array(
            'form' => $form->createView(),
            'flow' => $flow,
            'formData' => $formData,
            'haeuser' =>$häuser,
        ));
    }






}