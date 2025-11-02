// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {Config} from "forge-std/Config.sol";
import {StdStorage, stdStorage} from "forge-std/StdStorage.sol";

import {Constants} from "test/shared/Constants.sol";
import {Fixtures} from "test/shared/Fixtures.sol";

abstract contract BaseTest is Test, Config, Constants, Fixtures {
    using stdStorage for StdStorage;

    uint256 internal snapshotId = MAX_UINT256;

    modifier impersonate(address account) {
        vm.assume(account != address(0));
        vm.startPrank(account);
        _;
        vm.stopPrank();
    }

    modifier fork(uint256 chainId) {
        _loadConfigAndForks("./config/test.toml", false);
        vm.selectFork(forkOf[chainId]);
        _;
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
        if (snapshotId != MAX_UINT256) vm.revertToState(snapshotId);
        snapshotId = vm.snapshotState();
    }
}
