pragma solidity >=0.5.0 < 0.9.0;
import "./ERC20Interface.sol";
import "./BennyBuilder.sol";

contract Benny is BennyBuilder, IERC20 {
    function balanceOf(address _owner) external view returns (uint) {
        return addressToBennies[_owner];
}

    function transfer(address _to, address _from) public returns (bool) {

    }
}