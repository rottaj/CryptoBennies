pragma solidity >=0.5.0 < 0.9.0;
import "./ERC20Interface.sol";
import "./BennyBuilder.sol";
import "./SafeMath.sol";

abstract contract Benny is BennyBuilder, IERC20 {

    function totalSupply() external override view returns (uint) {
        return maxBennies;
    }
    function balanceOf(address _owner) external override view returns (uint) {
        return addressToBennies[_owner];
    }

    function _transfer(address _to, address _from, uint _tokenId) internal {
        require(addressToId[_from] == _tokenId || addressToId[msg.sender] == _tokenId);
        addressToBennies[_from] = addressToBennies[_from].sub(1);
        addressToBennies[_to] = addressToBennies[_to].add(1);
        emit Transfer(_to, _from, _tokenId);

    }

}