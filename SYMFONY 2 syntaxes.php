<?php
Doctrine repository
===================
	more info: http://symfony.com/doc/2.1/book/doctrine.html#book-doctrine-queries

	

	// query by the primary key (usually "id")
	$product = $repository->find($id);

	// dynamic method names to find based on a column value
	$product = $repository->findOneById($id);
	$product = $repository->findOneByName('foo');

	// find *all* products
	$products = $repository->findAll();

	// find a group of products based on an arbitrary column value
	$products = $repository->findByPrice(19.99);


	// query for one product matching be name and price
	$product = $repository->findOneBy(array('name' => 'foo', 'price' => 19.99));

	// query for all products matching the name, ordered by price
	$product = $repository->findBy(
	    array('name' => 'foo'),
	    array('price' => 'ASC')
	);
