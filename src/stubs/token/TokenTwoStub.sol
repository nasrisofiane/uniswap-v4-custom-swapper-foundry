// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract TokenTwoStub is ERC20 {
    constructor(uint256 initialSupply) ERC20("TokenTwoStub", "TTS") {
        _mint(msg.sender, initialSupply);
    }
}
