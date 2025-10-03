// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ICounter} from "src/interfaces/ICounter.sol";

/// @title Counter
contract Counter is ICounter {
    /// @inheritdoc ICounter
    uint256 public number;

    constructor(uint256 initialNumber) {
        number = initialNumber;
    }

    /// @inheritdoc ICounter
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    /// @inheritdoc ICounter
    function increment() public {
        number++;
    }
}
