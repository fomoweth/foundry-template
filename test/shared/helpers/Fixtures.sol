// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {StdCheats} from "forge-std/StdCheats.sol";
import {Counter} from "src/Counter.sol";
import {Constants} from "./Constants.sol";

abstract contract Fixtures is Constants, StdCheats {
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

    function createAccounts(string memory prefix, uint256 length, uint256 value)
        internal
        virtual
        returns (Account[] memory accounts)
    {
        accounts = new Account[](length);
        for (uint256 i; i < length; ++i) {
            string memory name = string.concat(prefix, " #", vm.toString(i));
            accounts[i] = createAccount(name, value);
        }
    }

    function createAccount(string memory name) internal virtual returns (Account memory account) {
        return createAccount(name, 0);
    }

    function createAccount(string memory name, uint256 value) internal virtual returns (Account memory account) {
        (account.addr, account.key) = makeAddrAndKey(name);
        vm.deal(account.addr, value);
    }
}
