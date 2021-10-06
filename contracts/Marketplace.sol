
pragma solidity ^ 0.5.0;

contract Marketplace{
    address buyer = msg.sender;
    string public name;
uint public ProductCount = 0;
mapping(uint => Product) public products;


// attributes for each new product.
struct Product{
    uint id;
    string name;
    uint  price;
    address  payable owner;
    bool purchased;
}

event ProductAdded(
    uint id,
    string name,
    uint price,
    address payable owner,
    bool purchased
);



//modifier valid_price(uint Product.price){
    //require(Product.price > 0, "price entered is not valid");
//_; }

event productpurchased(
    uint id,
    string name,
    uint price,
    address payable owner,
    bool purchased
);

function list_product(string memory _name, uint _price )public //valid_price(Product.price){
 {   ProductCount ++;

// appending each product listed to an id using a mapping.
    products [ProductCount] = Product(ProductCount,_name,_price,msg.sender,false);

emit ProductAdded(ProductCount,_name,_price,msg.sender,false);

}


function buyproducts(uint _id)public payable {
    //referencing Product struct here
    Product memory _product = products[_id];

    address  payable seller = _product.owner;
require(_product.id>0 && _product.id<ProductCount,"An Error has occured");
require(msg.value >= _product.price,"You are not paying the exact price amount");

_product.owner = msg.sender;

_product.purchased = true;
require(_product.purchased == false,"Product is taken");

require(seller != msg.sender,"You cannot buy your own products!");


products[_id] = _product;

address(seller).transfer(msg.value);

emit productpurchased(ProductCount,_product.name,_product.price,msg.sender,false);
}



}
