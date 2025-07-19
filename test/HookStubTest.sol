// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "../src/stubs/poolmanager/PoolManagerV4Stub.sol";
import {HookStub} from "../src/stubs/hook/HookStub.sol";
import {Test} from "forge-std/Test.sol";
import {HookStubScript} from "../src/stubs/utils/HookStubScript.sol";

contract HookStubTest is Test {
    IPoolManager poolManager;
    HookStub hookStub;
    HookStubScript hookStubScript;

    function setUp() public {
        poolManager = new PoolManagerV4Stub(address(this));
        hookStubScript = new HookStubScript(poolManager);
        hookStubScript.run();
        hookStub = hookStubScript.hookStub();
    }

    function test_hook_pool_manager_should_equal_deployment_pool_manager() public {
        assertEq(address(hookStub.poolManager()), address(poolManager));
    }
}
