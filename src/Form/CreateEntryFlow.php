<?php
namespace App\Form;

use App\Entity\Fahrzeugbesatzung;
use Craue\FormFlowBundle\Form\FormFlow;
use Craue\FormFlowBundle\Form\FormFlowInterface;
use Craue\FormFlowBundle\Event\PostBindSavedDataEvent;
use Craue\FormFlowBundle\Form\FormFlowEvents;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;


class CreateEntryFlow extends FormFlow implements EventSubscriberInterface
{
    /*protected $handleFileUploadsTempDir = '/public/images/';*/
    protected $allowDynamicStepNavigation = true;


    /**
     * {@inheritDoc}
     */
    public function setEventDispatcher(EventDispatcherInterface $dispatcher) {
        parent::setEventDispatcher($dispatcher);
        $dispatcher->addSubscriber($this);
    }
    /**
     * {@inheritDoc}
     */
    public static function getSubscribedEvents() {
        return array(
            FormFlowEvents::POST_BIND_SAVED_DATA => 'onPostBindSavedData',
        );
    }


    public function onPostBindSavedData(PostBindSavedDataEvent $event) {
        if ($event->getStepNumber() === 4) {
            print('hello');
            $formData = $event->getFormData();
            $besatzung=new Fahrzeugbesatzung();
            $formData->addBesatzung($besatzung);
            print('bye');
            $array = $formData->getBesatzung();

            foreach ($array as $key => $value){
                if($value->getRolle() == NULL){
                    $formData->removeBesatzung($array[$key]);
                }
                /*printf($value->getIdmitgliederMitglieder());*/
            }
            print('ende');

        }
    }

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
                'form_type' => 'App\Form\CreateEntryForm' //hier eigenes Form für die Besatzung?
            ),
            array(
                'label' => 'Zusammenfassung',
            ),
        );
    }

}