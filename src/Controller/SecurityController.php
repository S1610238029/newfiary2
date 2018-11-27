<?php

namespace App\Controller;


use function PHPSTORM_META\type;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

use Symfony\Component\HttpFoundation\Request;
use App\Form\UserType;
use App\Entity\User;
use App\Entity\Mitglieder;

class SecurityController extends AbstractController
{
    /**
     * @Route("/login", name="login")
     */
    public function loginAction(Request $request, AuthenticationUtils $utils)
    {
        // replace this example code with whatever you need
        $error = $utils->getLastAuthenticationError();

        $lastUsername = $utils->getLastUsername();


        return $this->render('pages/login.html.twig', [
            'error' => $error,
            'last_username' => $lastUsername
            ]);
    }

    /**
     * @Route("/logout", name="logout")
     * @throws \RuntimeException
     */
    public function logoutAction() {
        throw new \RuntimeException('This should never be called directly.');
    }

    /**
     * @Route("/dashboard", name="dashboard")
     */
    public function dashboardAction(){
        $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'Unable to access this page!');

        $em = $this->getDoctrine()->getManager();
        $users = $em->getRepository(User::class)->findAll(); //???

        $roleArray = array();
        foreach($users as $user) {
            $highestRole = $user->getHighestRole($user->getRoles());
            $roleArray[$user->getId()] = $highestRole;
        }

        return $this->render('security/dashboard.html.twig', [
            'users' => $users,
            'roleArray' => $roleArray,
        ]);
    }

    public function buildForm($user) {
        return $this->createFormBuilder($user)
            ->add('email', EmailType::class)
            ->add('username', TextType::class)
            ->add('plainPassword', RepeatedType::class, array(
                'type' => PasswordType::class,
                'first_options'  => array('label' => 'Password'),
                'second_options' => array('label' => 'Repeat Password'),
            ))
            ->add('roles',ChoiceType::class, [
                'multiple' => true,
                'expanded' => true,
                'choices' =>  (User::getRoleOptions())
            ])
            ->add('submit', SubmitType::class)
            ->getForm();
    }

    /**
     * @Route("editUser/{id}", name="user_edit")
     */
    public function editUserAction($id, Request $request) {
        $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'Unable to access this page!');

        $user = $this->getDoctrine()->getRepository(User::class)->find($id);

        $form = $this->buildForm($user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
        }

        return $this->render('security/editUser.html.twig', [
            'user' => $user,
            'form' => $form->createView()
        ]);
    }

    public function buildMemberForm($member) {
        return $this->createFormBuilder($member)
            ->add('standesbuchnummer', EmailType::class)
            ->add('dienstgrad', TextType::class)
            ->add('vorname', TextType::class)
            ->add('nachname', TextType::class)
            ->add('telefonNr', TextType::class)
            ->add('mobil', TextType::class)
            ->add('email', TextType::class)

            ->add('atemschutztauglich',ChoiceType::class, [
                'multiple' => false,
                'expanded' => true,
                'choices' =>  ['Ja' => true, 'Nein' => false]
            ])
            ->getForm();
    }

    /**
     * @Route("/newMember", name="member_new")
     */
    public function newMemberAction(Request $request) {
        $member = new Mitglieder();
        $form = $this->buildMemberForm($member);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $member = $form->getData();

            $em = $this->getDoctrine()->getManager();
            $em->persist($member);
            $em->flush();

            return $this->redirectToRoute('infos');
        }

        return $this->render('security/newMember.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
