// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Test} from "forge-std/Test.sol";
import {stdMath} from "forge-std/StdMath.sol";
import  {PoolManager} from "v4-core/PoolManager.sol";
import  {PoolKey} from "v4-core/types/PoolKey.sol";
import  {PoolId} from "v4-core/types/PoolId.sol";
import  {Currency} from "v4-core/types/Currency.sol";
import {PoolManagerV4Stub} from "../src/stubs/poolmanager/PoolManagerV4Stub.sol";
import {TokenOneStub} from "../src/stubs/token/TokenOneStub.sol";
import {TokenTwoStub} from "../src/stubs/token/TokenTwoStub.sol";
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {HookStubScript} from "../src/stubs/utils/HookStubScript.sol";
import {HookStub} from "../src/stubs/hook/HookStub.sol";
import {StateViewStub} from "../src/stubs/StateViewStub/StateViewStub.sol";
import {console} from "forge-std/console.sol";

contract PoolManagerV4StubTest is Test {
    PoolManager poolManager;
    ERC20 tokenOneStub;
    ERC20 tokenTwoStub;
    HookStub hookStub;
    HookStubScript hookStubScript;
    StateViewStub stateViewStub;

    uint256 mockedInitialSupplyTokenOne = 1000;
    uint256 mockedInitialSupplyTokenTwo = 4000;


    function setUp() public {
        poolManager = new PoolManagerV4Stub(address(this));
        tokenOneStub = new TokenOneStub(mockedInitialSupplyTokenOne);
        tokenTwoStub = new TokenOneStub(mockedInitialSupplyTokenTwo);
        hookStubScript = new HookStubScript(poolManager);
        hookStubScript.run();
        hookStub = hookStubScript.hookStub();
        stateViewStub = new StateViewStub(poolManager);
    }

    function test_pool_manager_owner_should_equal_deployment_owner() public {
        assertEq(poolManager.owner(), address(this));
    }

    function test_pool_manager_should_create_pool_with_two_tokens() public {
        //Given
        PoolKey memory poolKey = PoolKey(Currency.wrap(address(tokenOneStub)), Currency.wrap(address(tokenTwoStub)), 3000, 60, hookStub);
        uint160 sqrtPriceToInitialize = uint160(((tokenTwoStub.totalSupply() / tokenOneStub.totalSupply()) ** 2) * 2**96);

        //When
        poolManager.initialize(poolKey, sqrtPriceToInitialize);
        (uint160 sqrtPriceX96, int24 tick, uint24 protocolFee, uint24 lpFee) = stateViewStub.getSlot0(poolKey.toId());

        //Then
        assertEq(lpFee, poolKey.fee, "The pool fee is not equal");
        assertEq(sqrtPriceX96, sqrtPriceToInitialize, "The pool sqrt price is not equal");
    }
}
