// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Counter} from "src/Counter.sol";
import {Constants} from "./Constants.sol";

abstract contract Fixtures is Constants {
    function deployCounter(uint256 initialNumber) internal virtual returns (Counter counter) {
        bytes memory bytecode = bytes.concat(vm.getCode("Counter.sol:Counter"), abi.encode(initialNumber));
        return Counter(create(bytecode));
    }

    function create(bytes memory bytecode) internal virtual returns (address instance) {
        assembly ("memory-safe") {
            instance := create(0x00, add(bytecode, 0x20), mload(bytecode))
        }
    }

    function create2(bytes memory bytecode, bytes32 salt) internal virtual returns (address instance) {
        assembly ("memory-safe") {
            instance := create2(0x00, add(bytecode, 0x20), mload(bytecode), salt)
        }
    }
}
