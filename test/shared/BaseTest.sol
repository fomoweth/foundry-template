// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {StdStorage, stdStorage} from "forge-std/StdStorage.sol";
import {VmSafe} from "forge-std/Vm.sol";

import {Fixtures} from "test/shared/helpers/Fixtures.sol";
import {Fork} from "test/shared/helpers/Fork.sol";

abstract contract BaseTest is Test, Fixtures, Fork {
    using stdStorage for StdStorage;

    uint256 internal snapshotId = type(uint256).max;

    modifier impersonate(address account) {
        vm.assume(account != address(0));

        (VmSafe.CallerMode callerMode, address msgSender,) = vm.readCallers();
        if (callerMode == VmSafe.CallerMode.Prank) {
            vm.stopPrank();
            vm.startPrank(account);
            _;
            vm.stopPrank();
            vm.prank(msgSender != account ? msgSender : account);
        } else if (callerMode == VmSafe.CallerMode.RecurrentPrank) {
            if (msgSender != account) {
                vm.stopPrank();
                vm.startPrank(account);
                _;
                vm.stopPrank();
                vm.startPrank(msgSender);
            }
        } else {
            vm.startPrank(account);
            _;
            vm.stopPrank();
        }
    }

    function deal(address token, address account, uint256 value, bool adjust) internal virtual override {
        if (token == ETH || token == address(0)) {
            vm.deal(account, value);
        } else if (token == STETH) {
            // 0xf5eb42dc: sharesOf(address)
            // 0xd5002f2e: getTotalShares()
            deal(token, account, value, adjust, 0xf5eb42dc, 0xd5002f2e);
        } else if (token == EETH) {
            // 0xce7c2ac2: shares(address)
            // 0x3a98ef39: totalShares()
            deal(token, account, value, adjust, 0xce7c2ac2, 0x3a98ef39);
        } else {
            // 0x70a08231: balanceOf(address)
            // 0x18160ddd: totalSupply()
            deal(token, account, value, adjust, 0x70a08231, 0x18160ddd);
        }
    }

    function deal(
        address token,
        address account,
        uint256 value,
        bool adjust,
        bytes4 balanceOfSelector,
        bytes4 totalSupplySelector
    ) internal virtual {
        (, bytes memory returndata) = token.staticcall(abi.encodeWithSelector(balanceOfSelector, account));
        uint256 balancePrior = abi.decode(returndata, (uint256));

        stdstore.target(token).sig(balanceOfSelector).with_key(account).checked_write(value);

        if (adjust) {
            if (token == WETH9()) {
                if (value < balancePrior) {
                    vm.deal(token, token.balance - (balancePrior - value));
                } else {
                    vm.deal(token, token.balance + (value - balancePrior));
                }
            } else {
                (, returndata) = token.staticcall(abi.encodeWithSelector(totalSupplySelector));
                uint256 totalSupply = abi.decode(returndata, (uint256));

                if (value < balancePrior) {
                    totalSupply -= (balancePrior - value);
                } else {
                    totalSupply += (value - balancePrior);
                }

                stdstore.target(token).sig(totalSupplySelector).checked_write(totalSupply);
            }
        }
    }

    function revertToState() internal {
        if (snapshotId != type(uint256).max) vm.revertToState(snapshotId);
        snapshotId = vm.snapshotState();
    }
}
