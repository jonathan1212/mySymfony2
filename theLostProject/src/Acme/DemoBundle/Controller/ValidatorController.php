<?php

namespace Acme\DemoBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Symfony\Component\HttpFoundation\Response;
use Acme\BlogBundle\Entity\Author;


class ValidatorController extends Controller
{
    /**
     * @Route("index")
     * @Template()
     */
    public function indexAction()
    {
    	$author = new Author();
	    // ... do something to the $author object

	    $validator = $this->get('validator');
	    $errors = $validator->validate($author);

	    if (count($errors) > 0) {
	        return new Response(print_r($errors, true));
	    } else {
	        return new Response('The author is valid! Yes!');
	    }

    }

}
