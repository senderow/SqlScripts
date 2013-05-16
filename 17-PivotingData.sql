/* PIVOTING And UNPIVOTING DATA */
/* This is simply when you have something like 

orderid 	productname 	productqty
1 			Gift Card 		2
1 			Shipping 		1
2 			Gift Card 		2
2 			T-Shirt 		2
2 			Shipping 		2 

And want the output 
orderid 	Gift Card 	T-Shirt 	Shipping
1 			2 			NULL 		1
2 			2 			2 			2 