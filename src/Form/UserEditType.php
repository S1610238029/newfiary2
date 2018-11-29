<?php

// src/AppBundle/Form/UserEditType.php
namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;

class UserEditType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('username', TextType::class)
            ->add('email', EmailType::class)
            ->add('firstname', TextType::class)
            ->add('lastname', TextType::class)
            ->add('newPassword', RepeatedType::class, array(
                'type' => PasswordType::class,
                'mapped' => false,
                'required' => false,
                'first_options' => array('label' => 'New Password', 'mapped' => false),
                'second_options' => array('label' => 'Repeat New Password', 'mapped' => false)
            ))
            ->add('roles',ChoiceType::class, [
                'multiple' => true,
                'expanded' => true,
                'choices' =>  (User::getRoleOptions()),
            ])
            ->add('submit', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => User::class,
            'validation_groups' => array('edit'),
        ));
    }

    public function getName()
    {
        return 'change_passwd';
    }
}
