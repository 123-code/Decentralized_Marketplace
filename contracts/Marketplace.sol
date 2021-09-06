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
    address owner;
    bool purchased;
}

event ProductAdded(
    uint id,
    string name,
    uint price,
    address owner,
    bool purchased 
);

modifier name_length(string memory _name){
require(name.length > 0,"cannot be an empty name");
}

modifier valid_price(uint _price){
    require(price > 0, "price entered is not valid");
}



function list_product(string memory _name, uint _price )public name_length(_name), valid_price(_price){
    ProductCount ++;

// appending each product listed to an id using a mapping.
    products[ProductCount] = Product(ProductCount,_name,_price,msg.sender,false);

emit ProductAdded(ProductCount,_name,_price,msg.sender,false);

}

constructor()public{
name = "Token Powered Marketplece";
}



}
