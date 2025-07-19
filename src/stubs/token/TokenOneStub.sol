// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract TokenOneStub is ERC20 {
    constructor(uint256 initialSupply) ERC20("TokenOneStub", "TOS") {
        _mint(msg.sender, initialSupply);
    }
}
