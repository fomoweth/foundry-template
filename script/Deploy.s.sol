// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {BaseScript} from "./shared/BaseScript.sol";

contract DeployScript is BaseScript {
    function run() external returns (address counter) {
        bytes32 salt = vm.envOr({name: "SALT", defaultValue: bytes32(0)});
        uint256 initialNumber = 5;
        return run(initialNumber, salt);
    }

    function run(uint256 initialNumber, bytes32 salt) public broadcast returns (address counter) {
        bytes memory bytecode = bytes.concat(vm.getCode("Counter.sol:Counter"), abi.encode(initialNumber));
        string memory path = string.concat(vm.projectRoot(), "/deployments/", vm.toString(vm.getChainId()), ".json");
        encodeJson(path, "Counter", counter = create2(bytecode, salt), salt);
    }
}
