pragma solidity >=0.7.0 <0.9.0;
import "./ERC20Interface.sol";
import "./SafeMath.sol";

contract Benny is IERC20 {
    uint _maxBennies = 1000;
    uint _totalSupply;
    string _name; 
    string _symbol;
    //using SafeMath for uint256;
    mapping (address => uint) private _addressBalances;
    mapping (address => mapping (address => uint)) private _allowances;

    constructor() {
        _mint(msg.sender, (_maxBennies / 2));
        _name = "Bennies!";
        _symbol = "BNNY";
    }

    function name() public pure returns (string memory) {
        return _name;
    }

    function symbol() public pure returns (string memory) {
        return _symbol;
    }
    
    function balanceOf(address _owner) public override view returns (uint balance) {
        return _addressBalances[_owner];
    }

    function totalSupply() public override pure returns (uint) {
        return _totalSupply;
    }

    function transfer(address _to, uint _amount) public override returns (bool success) {
        _transfer(msg.sender, _to, _amount);
        return true;
    }
    function approve(address _spender, uint256 _amount) public override returns (bool) {
        _approve(msg.sender, _spender, _amount);
        return true;
    }

    function _approve(address _owner, address _spender, uint256 _amount) private {
        require(_owner != address(0));
        require(_spender != address(0));
        _allowances[_owner][_spender] = _amount;
        emit Approval(_owner, _spender, _amount);

    }

    function _transfer(address _to, address _from, uint _amount) internal {
        require(_addressBalances[_from] >= _amount); // check if amount doesn't exceed address balance.
        _addressBalances[_from] -= _amount;
        _addressBalances[_to] += _amount;
        emit Transfer(_from, _to, _amount);
    }

    function _mint(address _owner, uint _amount) internal virtual {
        require(_owner != address(0));
        require((_amount + _totalSupply) <= _maxBennies);    // check if the amount requested + current supply doesn't exceed max.
        _addressBalances[_owner] += _amount;
        _totalSupply += _amount; // add minted amount to total supply.
    }
}