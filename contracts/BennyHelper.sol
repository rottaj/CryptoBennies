pragma solidity >=0.7.0 <0.9.0;

abstract contract BennyHelper {
    function msgSender() public virtual returns (address) {
        return msg.sender;
    }
}