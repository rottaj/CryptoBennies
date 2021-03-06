pragma solidity >=0.7.0 <0.9.0;
//import "./ERC20Interface.sol";
import "./BennyHelper.sol";
import "./SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Benny is BennyHelper, ERC20 {
    uint _maxBennies = 1000;
    uint _totalSupply;
    string _name; 
    string _symbol;
    //using SafeMath for uint256;
    mapping (address => uint) private _addressBalances;
    mapping (address => mapping (address => uint)) private _allowances;

    constructor() ERC20("Bennies", "BNNY"){
        _mint(msg.sender, (_maxBennies / 2)); // Mint half to me... Allowing others to mint their own.
        _name = "Bennies!";
        _symbol = "BNNY";
    }

    function name() public override view returns (string memory) {
        return _name;
    }

    function symbol() public override view returns (string memory) {
        return _symbol;
    }
    
    function balanceOf(address _owner) public override view returns (uint balance) {
        return _addressBalances[_owner];
    }

    function totalSupply() public override view returns (uint) {
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

    function _approve(address _owner, address _spender, uint256 _amount) internal virtual override {
        require(_owner != address(0));
        require(_spender != address(0));
        _allowances[_owner][_spender] = _amount;
        emit Approval(_owner, _spender, _amount);

    }

    function _transfer(address _to, address _from, uint _amount) internal override {
        require(_addressBalances[_from] >= _amount); // check if amount doesn't exceed address balance.
        _addressBalances[_from] -= _amount;
        _addressBalances[_to] += _amount;
        emit Transfer(_from, _to, _amount);
    }

    function _mint(address _owner, uint _amount) internal virtual override {
        require(_owner != address(0));
        require(_amount <= 10); // only allow to mint 10 at a time.
        require((_amount + _totalSupply) <= _maxBennies);    // check if the amount requested + current supply doesn't exceed max.
        _addressBalances[_owner] += _amount;
        _totalSupply += _amount; // add minted amount to total supply.
    }
}