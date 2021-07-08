pragma solidity ^ 0.5.0;
contract Marketplace{
    address buyer = msg.sender;
    string public name;
constructor()public{
name = "Token Powered Marketplece";
}
}
