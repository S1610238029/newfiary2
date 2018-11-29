<?php

namespace App\Controller;

use App\Form\ChangePasswordType;
use App\Form\UserType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="user_registration")
     */
    public function registerAction(Request $request, UserPasswordEncoderInterface $passwordEncoder)
    {
        // 1) build the form
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        //TODO: hier eventuell form mit Email-Type erstellen

        // 2) handle the submit (will only happen on POST)
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            // 3) Encode the password (you could also do this via Doctrine listener)
            $password = $passwordEncoder->encodePassword($user, $user->getPlainPassword());
            $user->setPassword($password);

            // 4) save the User!
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            // ... do any other work - like sending them an email, etc
            // maybe set a "flash" success message for the user

            return $this->redirectToRoute('dashboard');
        }

        return $this->render(
            'pages/register.html.twig',
            array('form' => $form->createView())
        );
    }



    public function buildForm($user) {
        return $this->createFormBuilder($user)
            ->add('username', TextType::class)
            ->add('oldPassword', PasswordType::class)
            ->add('newPassword', RepeatedType::class, array(
                'type' => PasswordType::class,
                'first_options'  => array('label' => 'Password'),
                'second_options' => array('label' => 'Repeat Password'),
            ))
            ->add('submit', SubmitType::class)
            ->getForm();
    }

    /**
     * @Route("/recover", name="password_recover")
     */
    public function changePasswdAction(Request $request, UserPasswordEncoderInterface $passwordEncoder, AuthenticationUtils $utils) {
        $user = $this->getUser();
        $form = $this->createForm(ChangePasswordType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $oldPassword = $form->get('plainPassword')->getData();

            if($passwordEncoder->isPasswordValid($user, $oldPassword)) {
                $newPassword = $form->get('newPassword')->getData();
                $password = $passwordEncoder->encodePassword($user, $newPassword);
                $user->setPassword($password);
            } else {
                echo "<script type='text/javascript'>alert('falsch');</script>";
            }

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            // return $this->redirect($this->generateUrl('change_passwd_success'));
        }

        return $this->render('security/recover.html.twig', array(
            'form' => $form->createView(),
        ));

    }

}
