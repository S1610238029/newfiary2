<?php
namespace App\Form;

use Craue\FormFlowBundle\Form\FormFlow;
use Craue\FormFlowBundle\Form\FormFlowInterface;

class CreateEntryFlow extends FormFlow
{
    protected $handleFileUploadsTempDir = '/public/images/';
    protected $allowDynamicStepNavigation = true;


    protected function loadStepsConfig(){

        return array(
            array(
                'label' => 'Kategorie wählen',
                'form_type' => 'App\Form\CreateEntryForm',
            ),
            array(
                'label' => 'Allgemeine Details',
                'form_type' => 'App\Form\CreateEntryForm',
            ),
            array(
                'label' => 'Zusatzinfos+Fileupload',
                'form_type' => 'App\Form\CreateEntryForm'
            ),
            array(
                'label' => 'Besatzung',
                'form_type' => 'App\Form\CreateEntryForm'
            ),
            array(
                'label' => 'Zusammenfassung',
            ),
        );
    }

}