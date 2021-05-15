<?php

namespace App\Controller;

####### we need this for the form #######
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;######
#############################################


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\HttpFoundation\Request;#############

use App\Entity\Event;
use App\Entity\Type; ## for foreign key ##

class EventController extends AbstractController
{
    ################## Home Controller###########################
    #[Route('/', name: 'home')]
    public function index(): Response
    {
        // Here we will use getDoctrine to use doctrine and we will select the entity that we want to work with and we used findAll() to bring all the information from it and we will save it inside a variable named events and the type of the result will be an array
        $events = $this->getDoctrine()->getRepository('App:Event')->findAll();
        return $this->render('event/index.html.twig', array('events' => $events));

        // we send the result (the variable that have the result of bringing all info from our database) to the index.html.twig page
        
    }


    ##################  Filter Controller  ###########################
    #[Route('/filter/{type}', name: 'event_filter')]
    public function filterAction($type): Response
    {
        $events = $this->getDoctrine()->getRepository('App:Event')->findBy(['fkType' => $type]);
        // dd($events);
        return $this->render('event/filter.html.twig', array('events' => $events));
        
    }  



  ################## Create Controller ###########################
  #[Route('/create', name: 'event_create')]

    public function create(Request $request): Response

    {

        // Here we create an object from the class that we made

        $event = new Event;

/* Here we will build a form using createFormBuilder and inside this function we will put our object and then we write add then we select the input type then an array to add an attribute that we want in our input field */

        $form = $this->createFormBuilder($event)->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('schedulded', DateTimeType::class, array('label' => 'Scheduled', 'attr' => array('style'=>'margin-bottom:15px')))

        ->add('image', TextType::class, array('required'=> false, 'attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))

        ->add('description', TextareaType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))

        ->add('capacity', IntegerType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))

                ##for foreign key: ##
        ->add('fk_type', EntityType::class, [
                    'label' => 'Event Type',## to change the default label##
                    'class' => Type::class,
                    'choice_label' => 'name',
                ])

        ->add('address', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('phone', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('email', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('url', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ##for foreign key: ##
        ->add('fk_type', EntityType::class, [
            'label' => 'Event Type',## to change the default label##
            'class' => Type::class,
            'choice_label' => 'name',
        ])

        ->add('save', SubmitType::class, array('label'=> 'Create Event', 'attr' => array('class'=> 'btn-primary', 'style'=>'margin-bottom:15px')))

        ->getForm();

        $form->handleRequest($request);

       


        /* Here we have an if statement, if we click submit and if  the form is valid we will take the values from the form and we will save them in the new variables */

        if($form->isSubmitted() && $form->isValid()){

            //fetching data


            // taking the data from the inputs by the name of the inputs then getData() function


            $name = $form['name']->getData();
            $schedulded = $form['schedulded']->getData();
            $image = $form['image']->getData();
            $description = $form['description']->getData();
            $capacity = $form['capacity']->getData();
            $address = $form['address']->getData();
            $phone = $form['phone']->getData();
            $email = $form['email']->getData();
            $url = $form['url']->getData();
           



/* these functions we bring from our entities, every column have a set function and we put the value that we get from the form */

            $event->setName($name);

            $event->setSchedulded($schedulded);

            $event->setImage($image);

            $event->setDescription($description);

            $event->setCapacity($capacity);

            $event->setAddress($address);

            $event->setPhone($phone);

            $event->setEmail($email);

            $event->setUrl($url);

            $em = $this->getDoctrine()->getManager();

            $em->persist($event);

            $em->flush();

            $this->addFlash(

                    'notice',

                    'Event Added'

                    );

            return $this->redirectToRoute('home');

        }

 /* now to make the form we will add this line form->createView() and now you can see the form in create.html.twig file  */

        return $this->render('event/create.html.twig', array('form' => $form->createView()));


    }



     ##################  Details Controller  ###########################
     #[Route('/details/{id}', name: 'event_details')]
     public function detailsAction($id): Response
     {
         $event = $this->getDoctrine()->getRepository('App:Event')->find($id);
         return $this->render('event/details.html.twig', array('event' => $event));
         
     }


    ################## Edit Controller ###########################
    #[Route('/edit/{id}', name: 'event_edit')]
    public function editAction(Request $request, $id): Response
    {
        $event = $this->getDoctrine()->getRepository('App:Event')->find($id);


        $form = $this->createFormBuilder($event)->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('schedulded', DateTimeType::class, array('label' => 'Scheduled', 'attr' => array('style'=>'margin-bottom:15px')))

        ->add('image', TextType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))

        ->add('description', TextareaType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))

        ->add('capacity', IntegerType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))

        ##for foreign key: ##
        ->add('fk_type', EntityType::class, [
                    'label' => 'Event Type',## to change the default label##
                    'class' => Type::class,
                    'choice_label' => 'name',
                ])

        ->add('address', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('phone', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('email', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))

        ->add('url', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ##for foreign key: ##
        ->add('fk_type', EntityType::class, [
            'label' => 'Event Type',## to change the default label##
            'class' => Type::class,
            'choice_label' => 'name',
        ])

        ->add('save', SubmitType::class, array('label'=> 'Edit Event', 'attr' => array('class'=> 'btn-primary', 'style'=>'margin-bottom:15px')))
            ->getForm();
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            //fetching data
            $name = $form['name']->getData();
            $schedulded = $form['schedulded']->getData();
            $description = $form['description']->getData();
            $image = $form['image']->getData();
            $capacity = $form['capacity']->getData();
            $address = $form['address']->getData();
            $phone = $form['phone']->getData();
            $email = $form['email']->getData();
            $url = $form['url']->getData();



            $em = $this->getDoctrine()->getManager();
            $event = $em->getRepository('App:Event')->find($id);
            $event->setName($name);

            $event->setSchedulded($schedulded);

            $event->setImage($image);

            $event->setDescription($description);

            $event->setCapacity($capacity);

            $event->setAddress($address);

            $event->setPhone($phone);

            $event->setEmail($email);

            $event->setUrl($url);

            $em->flush();
            $this->addFlash(
                'notice',
                'Event Updated'
            );
            return $this->redirectToRoute('home');
        }
        return $this->render('event/edit.html.twig', array('event' => $event, 'form' => $form->createView()));

        
    }



    ################## Delete Controller ###########################

    /**
     * @Route("/delete/{id}", name="event_delete")
     */
    #[Route('/delete/{id}', name: 'event_delete')]
    public function delete($id)
    {
        $em = $this->getDoctrine()->getManager();
        $sport = $em->getRepository('App:Event')->find($id);
        $em->remove($sport);
        $em->flush();
        $this->addFlash(
            'notice',
            'Event Removed'
        );
        return $this->redirectToRoute('home');
    }



}
