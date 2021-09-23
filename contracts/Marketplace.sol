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
    uint price;
    address  payable owner;
    bool purchased;
}

event ProductAdded(
    uint id,
    string name,
    uint price,
    address  payable owner,
    bool purchased 
);

modifier name_length(string memory _name){
    require(_name.length > 0, "Name cannot be empty!"); _;
}

modifier valid_price(uint _price){
    require(Product.price > 0, "price entered is not valid");
_; }

event productpurchased(
    uint id,
    string name,
    uint price,
    address payable owner,
    bool purchased
);

function list_product(string memory _name, uint _price )public name_length(Product.name) valid_price(Product.price){
    ProductCount ++;

// appending each product listed to an id using a mapping.
    products[ProductCount] = Product(ProductCount,_name,_price,msg.sender,false);

emit ProductAdded(ProductCount,_name,_price,msg.sender,false);

}


function buyproducts(uint _id)public payable {
    Product memory _product = products[_id];

    address  payable seller = _product.owner;
require(_product.id  > 0 && _product.id < ProductCount);
require(msg.value == Product.price);
_product.owner = msg.sender;

_product.purchased = true;

products[_id] = _product;

address(seller).transfer(msg.value);

emit productpurchased(ProductCount,Product.name,Product.price,msg.sender,false);
}

constructor()public{
name = "Token Powered Marketplece";
}



}
    uint id,
    string name,
    uint price,
    address payable owner,
    bool purchased
);

function list_product(string memory _name, uint _price )public name_length(_name), valid_price(_price){
    ProductCount ++;

// appending each product listed to an id using a mapping.
    products[ProductCount] = Product(ProductCount,_name,_price,msg.sender,false);

emit ProductAdded(ProductCount,_name,_price,msg.sender,false);

}


function buyproducts(uint _id)public payable {
    Product memory _product = products[_id];

    address  payable seller = _product.owner;

_product.owner = msg.sender;

_product.purchased = true;

products[_id] = _product;

address(_seller).transfer(msg.value);

emit productpurchased(ProductCount,_name,_price,msg.sender,false);
}

constructor()public{
name = "Token Powered Marketplece";
}



}
