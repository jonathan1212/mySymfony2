<?php

namespace Acme\DemoBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Response;

class RoutingController extends Controller
{
    /**
     * @Route("/routing/blog/my-blog-post",name="demo_blogpost")
     * @Template
     */
    public function blogPostAction()
    {
        
        $params = $this->get('router')->match('/blog/my-blog-post');
		// array(
		//     'slug'        => 'my-blog-post',
		//     '_controller' => 'AcmeBlogBundle:Blog:show',
		// )

		$uri = $this->get('router')->generate('blog_show', array('slug' => 'my-blog-post'));
		// /blog/my-blog-post
    }
    /**
     * @Route("/routing/show/{slug}", name="blog_show")
     * @Template()
     */
    public function showAction($slug)
    {
        // ...

        $url = $this->generateUrl(
            'blog_show',
            array('slug' => 'my-blog-post')
        );
        echo $url;
        exit;
    }

    /**
     * @Route("/routing/blog")
     * @Template()
     */
    public function blogAction()
    {
        $router->generate('blog', array('page' => 2, 'category' => 'Symfony'));
		// /blog/2?category=Symfony
    }

    /**
     * @Route("/blog/{page}")
     * @Template()
     */
    public function testAction($param)
    {
        echo $param;
        exit;
    }
}