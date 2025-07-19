// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import {Hooks} from "v4-core/libraries/Hooks.sol";
import {IPoolManager} from "v4-core/interfaces/IPoolManager.sol";
import {HookMiner} from "v4-periphery/src/utils/HookMiner.sol";
import {HookStub} from "../hook/HookStub.sol";

contract HookStubScript is Script {
    IPoolManager poolManager;
    HookStub public hookStub;

    constructor(IPoolManager _poolManager) {
        poolManager = _poolManager;
    }

    function setUp() public {
    }

    function run() public {
        // hook contracts must have specific flags encoded in the address
        uint160 flags = uint160(
            Hooks.BEFORE_INITIALIZE_FLAG
        );

        // Mine a salt that will produce a hook address with the correct flags
        bytes memory constructorArgs = abi.encode(poolManager);
        (address hookAddress, bytes32 salt) =
                            HookMiner.find(CREATE2_FACTORY, flags, type(HookStub).creationCode, constructorArgs);

        // Deploy the hook using CREATE2
        vm.broadcast();
        hookStub = new HookStub{salt: salt}(poolManager);
        require(address(hookStub) == hookAddress, "HookStubScript: hook address mismatch");
    }
}
