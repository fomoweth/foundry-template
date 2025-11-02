// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Counter} from "src/Counter.sol";
import {BaseTest} from "test/shared/BaseTest.sol";

contract CounterTest is BaseTest {
    uint256 internal initialNumber = 10;
    Counter internal counter;

    function setUp() public virtual {
        counter = deployCounter(initialNumber);
    }

    function test_constructor() public view {
        assertEq(counter.number(), initialNumber);
    }

    function test_fuzz_setNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function test_setNumber_gas() public {
        uint256 x = 100;
        counter.setNumber(x);
        vm.snapshotGasLastCall("Counter#setNumber");
    }

    function test_increment() public {
        counter.increment();
        assertEq(counter.number(), initialNumber + 1);
    }

    function test_increment_gas() public {
        counter.increment();
        vm.snapshotGasLastCall("Counter#increment");
        assertEq(counter.number(), initialNumber + 1);
    }
}
