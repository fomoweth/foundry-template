// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {CommonBase} from "forge-std/Base.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {Counter} from "src/Counter.sol";

abstract contract Fixtures is CommonBase, StdCheats {
    function deployCounter(uint256 initialNumber) internal returns (Counter counter) {
        bytes memory bytecode = bytes.concat(vm.getCode("Counter.sol:Counter"), abi.encode(initialNumber));
        return Counter(create(bytecode));
    }

    function create(bytes memory bytecode) internal returns (address instance) {
        return create(bytecode, 0);
    }

    function create(bytes memory bytecode, uint256 value) internal returns (address instance) {
        assembly ("memory-safe") {
            instance := create(value, add(bytecode, 0x20), mload(bytecode))
        }
    }

    function create2(bytes memory bytecode, bytes32 salt) internal returns (address instance) {
        return create2(bytecode, salt, 0);
    }

    function create2(bytes memory bytecode, bytes32 salt, uint256 value) internal returns (address instance) {
        assembly ("memory-safe") {
            instance := create2(value, add(bytecode, 0x20), mload(bytecode), salt)
        }
    }

    function createAccounts(string memory name, uint256 length, uint256 value)
        internal
        returns (Account[] memory accounts)
    {
        accounts = new Account[](length);
        for (uint256 i; i < length; ++i) {
            accounts[i] = createAccount(string.concat(name, " #", vm.toString(i)), value);
        }
    }

    function createAccount(string memory name) internal returns (Account memory account) {
        return createAccount(name, 0);
    }

    function createAccount(string memory name, uint256 value) internal returns (Account memory account) {
        (account.addr, account.key) = makeAddrAndKey(name);
        if (value != 0) vm.deal(account.addr, value);
    }
}
