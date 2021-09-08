pragma solidity >=0.7.0 <0.9.0;
import "./ERC20Interface.sol";
import "./SafeMath.sol";

contract Benny is IERC20 {
    uint _maxBennies = 1000;
    uint _totalSupply;
    string _name; 
    //using SafeMath for uint256;
    mapping (address => uint) _addressBalances;

    constructor() {
        _mint(msg.sender, _maxBennies);
        _name = "Bennies!";
    }

    function name() public pure returns (string memory name) {
        return _name;
    }

    function _transfer(address _to, address _from, uint _amount) internal {
        require(_addressBalances[_from] >= _amount);
        _addressBalances[_from] -= _amount;
        _addressBalances[_to] += _amount;
        emit Transfer(_from, _to, _amount);
    }

    function _mint(address _owner, uint _amount) internal virtual {
        require(_owner != address(0));
        require((_amount + _totalSupply) <= _maxBennies);
    }
}