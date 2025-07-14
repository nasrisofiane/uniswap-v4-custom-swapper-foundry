// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "@uniswap/v4-core/src/PoolManager.sol";
import "@uniswap/v4-core/src/types/PoolId.sol";
import "@uniswap/v4-core/src/types/Slot0.sol";

contract PoolManagerV4Stub is PoolManager {
    constructor(address initialOwner) PoolManager(initialOwner){

    }

}
