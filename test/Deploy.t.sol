// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {Counter} from "src/Counter.sol";
import {DeployScript} from "script/Deploy.s.sol";

contract DeployTest is Test {
    Counter internal counter;

    function setUp() public virtual {
        counter = Counter(new DeployScript().run());
    }

    function test_deploy() public view {
        assertEq(counter.number(), 5);
    }
}
