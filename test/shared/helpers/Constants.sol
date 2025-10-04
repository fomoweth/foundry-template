// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {CommonBase} from "forge-std/Base.sol";

abstract contract Constants is CommonBase {
    address internal constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address internal constant STETH = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address internal constant EETH = 0x35fA164735182de50811E8e2E824cFb9B6118ac2;

    function WETH9() internal view virtual returns (address token) {
        return WETH9(block.chainid);
    }

    function WETH9(uint256 chainId) internal pure virtual returns (address token) {
        assembly ("memory-safe") {
            switch chainId
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
            default { token := 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 }
        }
    }

    function WBTC() internal view virtual returns (address token) {
        return WBTC(block.chainid);
    }

    function WBTC(uint256 chainId) internal pure virtual returns (address token) {
        assembly ("memory-safe") {
            switch chainId
            case 1 { token := 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599 }
            case 10 { token := 0x68f180fcCe6836688e9084f035309E29Bf0A2095 }
            case 56 { token := 0x0555E30da8f98308EdB960aa94C0Db47230d2B9c }
            case 130 { token := 0x0555E30da8f98308EdB960aa94C0Db47230d2B9c }
            case 137 { token := 0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6 }
            case 8453 { token := 0x0555E30da8f98308EdB960aa94C0Db47230d2B9c }
            case 42161 { token := 0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f }
            case 43114 { token := 0x50b7545627a5162F82A992c33b87aDc75187B218 }
            default { token := 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599 }
        }
    }

    function DAI() internal view virtual returns (address token) {
        return DAI(block.chainid);
    }

    function DAI(uint256 chainId) internal pure virtual returns (address token) {
        assembly ("memory-safe") {
            switch chainId
            case 1 { token := 0x6B175474E89094C44Da98b954EedeAC495271d0F }
            case 10 { token := 0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1 }
            case 56 { token := 0x1AF3F329e8BE154074D8769D1FFa4eE058B1DBc3 }
            case 130 { token := 0x20CAb320A855b39F724131C69424240519573f81 }
            case 137 { token := 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063 }
            case 8453 { token := 0x50c5725949A6F0c72E6C4a641F24049A917DB0Cb }
            case 42161 { token := 0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1 }
            case 43114 { token := 0xd586E7F844cEa2F87f50152665BCbc2C279D8d70 }
            default { token := 0x6B175474E89094C44Da98b954EedeAC495271d0F }
        }
    }

    function USDC() internal view virtual returns (address token) {
        return USDC(block.chainid);
    }

    function USDC(uint256 chainId) internal pure virtual returns (address token) {
        assembly ("memory-safe") {
            switch chainId
            case 1 { token := 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 }
            case 10 { token := 0x7F5c764cBc14f9669B88837ca1490cCa17c31607 }
            case 56 { token := 0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d }
            case 130 { token := 0x078D782b760474a361dDA0AF3839290b0EF57AD6 }
            case 137 { token := 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174 }
            case 8453 { token := 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913 }
            case 42161 { token := 0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8 }
            case 43114 { token := 0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E }
            default { token := 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 }
        }
    }

    function USDT() internal view virtual returns (address token) {
        return USDT(block.chainid);
    }

    function USDT(uint256 chainId) internal pure virtual returns (address token) {
        assembly ("memory-safe") {
            switch chainId
            case 1 { token := 0xdAC17F958D2ee523a2206206994597C13D831ec7 }
            case 10 { token := 0x94b008aA00579c1307B0EF2c499aD98a8ce58e58 }
            case 56 { token := 0x55d398326f99059fF775485246999027B3197955 }
            case 130 { token := 0x9151434b16b9763660705744891fA906F660EcC5 }
            case 137 { token := 0xc2132D05D31c914a87C6611C10748AEb04B58e8F }
            case 8453 { token := 0xfde4C96c8593536E31F229EA8f37b2ADa2699bb2 }
            case 42161 { token := 0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9 }
            case 43114 { token := 0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7 }
            default { token := 0xdAC17F958D2ee523a2206206994597C13D831ec7 }
        }
    }
}
