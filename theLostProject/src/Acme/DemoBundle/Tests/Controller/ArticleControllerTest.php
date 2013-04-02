<?php

namespace Acme\DemoBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ArticleControllerTest extends WebTestCase
{
    public function testTest()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', 'test');
    }

}
