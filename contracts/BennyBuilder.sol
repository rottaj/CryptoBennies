pragma solidity >=0.5.0 < 0.9.0;

import "./SafeMath.sol";
//using SafeMath for add;

contract BennyBuilder {

    uint maxBennies = 1000;
    mapping (uint => address) idToOwner;
    mapping (address => uint) addressToId;
    mapping (address => uint) addressToBennies;
    struct Benny {
        address owner;
    }

    Benny[] public bennies;

    function _createBenny(address _owner) internal {
        Benny memory newBenny = Benny(_owner);
        bennies.push(newBenny);
        uint id = bennies.length - 1;
        idToOwner[id] = _owner;
        addressToId[_owner] = id;
        addressToBennies[_owner]++;
        //addressToBennies[_owner] = addressToBennies.add(1);
    }

    function createBenny(address _owner) public {
        require(addressToBennies[_owner] == 0);
        require(maxBennies < 1000);
        _createBenny(_owner);
    }
}


