// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Test} from "forge-std/Test.sol";
import {TokenTwoStub} from "../src/stubs/token/TokenTwoStub.sol";
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract TokenTwoStubTest is Test {
    ERC20 tokenTwoStub;
    uint256 mockedInitialSupply = 2000;

    function setUp() public {
        tokenTwoStub = new TokenTwoStub(mockedInitialSupply);
    }


    function test_totalSupply_should_equal_initial_supply() public {
        assertEq(tokenTwoStub.totalSupply(), mockedInitialSupply);
    }
}