// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@uniswap/v4-periphery/src/lens/StateView.sol";

contract StateViewStub is StateView {
    constructor(IPoolManager _poolManager) StateView(_poolManager){

    }
}
