// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {CommonBase} from "forge-std/Base.sol";

abstract contract Constants is CommonBase {
    address internal constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address internal constant STETH = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address internal constant EETH = 0x35fA164735182de50811E8e2E824cFb9B6118ac2;

    function WETH9() internal view virtual returns (address weth9) {
        return WETH9(block.chainid);
    }

    function WETH9(uint256 chainId) internal pure virtual returns (address weth9) {
        assembly ("memory-safe") {
            switch chainId
            case 1 { weth9 := 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 }
            case 10 { weth9 := 0x4200000000000000000000000000000000000006 }
            // WBNB
            case 56 { weth9 := 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c }
            case 130 { weth9 := 0x4200000000000000000000000000000000000006 }
            // WPOL
            case 137 { weth9 := 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270 }
            case 8453 { weth9 := 0x4200000000000000000000000000000000000006 }
            case 42161 { weth9 := 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1 }
            // WAVAX
            case 43114 { weth9 := 0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7 }
            default { weth9 := 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 }
        }
    }
}
