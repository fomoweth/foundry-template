// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Chains} from "./Chains.sol";
import {Constants} from "./Constants.sol";

abstract contract Fork is Constants {
    modifier onlyOnMainnet() {
        vm.skip(!Chains.isMainnet());
        _;
    }

    modifier onlyOnTestnet() {
        vm.skip(!Chains.isTestnet());
        _;
    }

    modifier onlyOnEthereum() {
        vm.skip(!Chains.isEthereum());
        _;
    }

    modifier onlyOnOptimism() {
        vm.skip(!Chains.isOptimism());
        _;
    }

    modifier onlyOnBNB() {
        vm.skip(!Chains.isBNB());
        _;
    }

    modifier onlyOnUnichain() {
        vm.skip(!Chains.isUnichain());
        _;
    }

    modifier onlyOnPolygon() {
        vm.skip(!Chains.isPolygon());
        _;
    }

    modifier onlyOnBase() {
        vm.skip(!Chains.isBase());
        _;
    }

    modifier onlyOnArbitrum() {
        vm.skip(!Chains.isArbitrum());
        _;
    }

    modifier onlyOnAvalanche() {
        vm.skip(!Chains.isAvalanche());
        _;
    }

    function selectChain(uint256 chainId) internal virtual returns (uint256) {
        return selectChain(chainId, 0);
    }

    function selectChain(uint256 chainId, uint256 blockNumber) internal virtual returns (uint256) {
        if (chainId == block.chainid) {
            if (blockNumber != 0) vm.roll(blockNumber);
            return vm.activeFork();
        }
        return createSelectFork(chainId, blockNumber);
    }

    function createSelectFork(uint256 chainId) internal virtual returns (uint256) {
        return createSelectFork(chainId, 0);
    }

    function createSelectFork(uint256 chainId, uint256 blockNumber) internal virtual returns (uint256) {
        return createSelectFork(Chains.getChainAlias(chainId), blockNumber);
    }

    function createSelectFork(string memory chainAlias) internal virtual returns (uint256) {
        return createSelectFork(chainAlias, 0);
    }

    function createSelectFork(string memory chainAlias, uint256 blockNumber) internal virtual returns (uint256) {
        return blockNumber == 0
            ? vm.createSelectFork(vm.rpcUrl(chainAlias))
            : vm.createSelectFork(vm.rpcUrl(chainAlias), blockNumber);
    }
}
