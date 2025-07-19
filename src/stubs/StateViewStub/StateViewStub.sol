// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {StateView} from 'v4-periphery/src/lens/StateView.sol';
import {IPoolManager} from "v4-core/interfaces/IPoolManager.sol";

contract StateViewStub is StateView {
    constructor(IPoolManager _poolManager) StateView(_poolManager){

    }
}
