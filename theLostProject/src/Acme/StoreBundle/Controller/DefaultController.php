<?php

namespace Acme\StoreBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Acme\StoreBundle\Entity\Product;
use Symfony\Component\HttpFoundation\Response;


class DefaultController extends Controller
{
    /**
     * @Route("/hello/{name}")
     * @Template()
     */
    public function indexAction($name)
    {
        return array('name' => $name);
    }

	/**
     * @Route("/store/create")
     * @Template()
     */
    public function createAction()
	{
	    $product = new Product();
	    $product->setName('A Foo Bar');
	    $product->setPrice('19.99');
	    $product->setDescription('Lorem ipsum dolor');

	    $em = $this->getDoctrine()->getManager();
	    $em->persist($product);
	    $em->flush();

	    return new Response('Created product id '.$product->getId());
	}
	/**
     * @Route("/store/show")
     * @Template()
     */
	public function showAction($id)
	{	

	    $product = $this->getDoctrine()
	        ->getRepository('AcmeStoreBundle:Product')
	        ->findOneByIdJoinedToCategory($id);

	    $categoryName = $product->getCategory()->getName();
	    

	    if (!$product) {
	        throw $this->createNotFoundException(
	            'No product found for id '.$id
	        );
	    }

	    // ... do something, like pass the $product object into a template


	}

	/**
     * @Route("/store/update/{id}")
     * @Template()
     */	
	public function updateAction($id)
	{
	    $em = $this->getDoctrine()->getManager();
	    $product = $em->getRepository('AcmeStoreBundle:Product')->find($id);

	    if (!$product) {
	        throw $this->createNotFoundException(
	            'No product found for id '.$id
	        );
	    }

	    $product->setName('New product name!');
	    $em->flush();

	    return $this->redirect($this->generateUrl('homepage'));


	    /*deleting an object*/

	    //$em->remove($product);
		//$em->flush();
	}

	public function showProductAction($id)
	{
	    $category = $this->getDoctrine()
	        ->getRepository('AcmeStoreBundle:Category')
	        ->find($id);

	    $products = $category->getProducts();

	    // ...


	    $product = $this->getDoctrine()
		    ->getRepository('AcmeStoreBundle:Product')
		    ->find($id);

		$category = $product->getCategory();

		// prints "Proxies\AcmeStoreBundleEntityCategoryProxy"
		echo get_class($category);
	}
}
