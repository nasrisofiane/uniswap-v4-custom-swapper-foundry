// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Test} from "forge-std/Test.sol";
import {TokenOneStub} from "../src/stubs/token/TokenOneStub.sol";
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract TokenOneStubTest is Test {
    ERC20 tokenOneStub;
    uint256 mockedInitialSupply = 2000;

    function setUp() public {
        tokenOneStub = new TokenOneStub(mockedInitialSupply);
    }


    function test_totalSupply_should_equal_initial_supply() public {
        assertEq(tokenOneStub.totalSupply(), mockedInitialSupply);
    }
}