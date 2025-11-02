// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

abstract contract Constants {
    address internal constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address internal constant STETH = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address internal constant EETH = 0x35fA164735182de50811E8e2E824cFb9B6118ac2;

    function WETH9() internal view returns (address token) {
        assembly ("memory-safe") {
            switch chainid()
            case 1 { token := 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 }
            case 10 { token := 0x4200000000000000000000000000000000000006 }
            // WBNB
            case 56 { token := 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c }
            case 130 { token := 0x4200000000000000000000000000000000000006 }
            // WPOL
            case 137 { token := 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270 }
            case 8453 { token := 0x4200000000000000000000000000000000000006 }
            case 42161 { token := 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1 }
            // WAVAX
            case 43114 { token := 0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7 }
            case 59144 { token := 0xe5D7C2a44FfDDf6b295A15c148167daaAf5Cf34f }
            case 534352 { token := 0x5300000000000000000000000000000000000004 }
            default { token := 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 }
        }
    }

    uint256 internal constant MAX_UINT256 = type(uint256).max;
    uint160 internal constant MAX_UINT160 = type(uint160).max;
    uint128 internal constant MAX_UINT128 = type(uint128).max;
    uint48 internal constant MAX_UINT48 = type(uint48).max;
}
