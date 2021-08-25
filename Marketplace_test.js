// testing the contract was deployed to the blockchain
const Marketplace = artifacts.require('./Marketplace.sol');

contract Marketplace(accounts)=>{
    let marketplace;

before(async()=>{
marketplace = await Marketplace.deployed();
})   

describe('deployment',async() => {
it('deploys successfully',async()=>{
    const address = await marketplace.address
    assert.notEqual(address,0x0)
})
})
})
