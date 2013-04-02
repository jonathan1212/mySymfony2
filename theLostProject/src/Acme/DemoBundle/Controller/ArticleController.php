<?php

namespace Acme\DemoBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class ArticleController extends Controller
{
    /**
     * @Route("test")
     * @Template()
     */
    public function testAction()
    {
    }
	

	/**
     * @Route("/article/{max}", name="latest_articles")
     * @Template()
     */
    public function recentArticlesAction($max = 3)
    {
        // make a database call or other logic
        // to get the "$max" most recent articles
        $articles = array('name'=> 'joanthan','gender' => 'male');

        return $this->render(
            'AcmeArticleBundle:Article:recentList.html.twig',
            array('articles' => $articles)
        );
    }

}
