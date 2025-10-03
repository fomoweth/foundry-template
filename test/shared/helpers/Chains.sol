// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

library Chains {
    error UnsupportedChain();

    uint256 internal constant ANVIL = 31337;

    uint256 internal constant ETHEREUM = 1;
    uint256 internal constant SEPOLIA = 11155111;

    uint256 internal constant OPTIMISM = 10;
    uint256 internal constant OPTIMISM_SEPOLIA = 11155420;

    uint256 internal constant BNB = 56;
    uint256 internal constant BNB_TESTNET = 97;

    uint256 internal constant UNICHAIN = 130;
    uint256 internal constant UNICHAIN_SEPOLIA = 1301;

    uint256 internal constant POLYGON = 137;
    uint256 internal constant POLYGON_AMOY = 80002;

    uint256 internal constant BASE = 8453;
    uint256 internal constant BASE_SEPOLIA = 84532;

    uint256 internal constant ARBITRUM = 42161;
    uint256 internal constant ARBITRUM_SEPOLIA = 421614;

    uint256 internal constant AVALANCHE = 43114;
    uint256 internal constant AVALANCHE_FUJI = 43113;

    function getChainAlias(uint256 chainId) internal pure returns (string memory) {
        if (chainId == ETHEREUM) {
            return "ethereum";
        } else if (chainId == SEPOLIA) {
            return "sepolia";
        } else if (chainId == OPTIMISM) {
            return "optimism";
        } else if (chainId == OPTIMISM_SEPOLIA) {
            return "optimism-sepolia";
        } else if (chainId == BNB) {
            return "bnb";
        } else if (chainId == BNB_TESTNET) {
            return "bnb-testnet";
        } else if (chainId == UNICHAIN) {
            return "unichain";
        } else if (chainId == UNICHAIN_SEPOLIA) {
            return "unichain-sepolia";
        } else if (chainId == POLYGON) {
            return "polygon";
        } else if (chainId == POLYGON_AMOY) {
            return "polygon-amoy";
        } else if (chainId == BASE) {
            return "base";
        } else if (chainId == BASE_SEPOLIA) {
            return "base-sepolia";
        } else if (chainId == ARBITRUM) {
            return "arbitrum";
        } else if (chainId == ARBITRUM_SEPOLIA) {
            return "arbitrum-sepolia";
        } else if (chainId == AVALANCHE) {
            return "avalanche";
        } else if (chainId == AVALANCHE_FUJI) {
            return "avalanche-fuji";
        } else {
            revert UnsupportedChain();
        }
    }

    function isEthereum() internal view returns (bool) {
        return block.chainid == ETHEREUM;
    }

    function isOptimism() internal view returns (bool) {
        return block.chainid == OPTIMISM;
    }

    function isBNB() internal view returns (bool) {
        return block.chainid == BNB;
    }

    function isUnichain() internal view returns (bool) {
        return block.chainid == UNICHAIN;
    }

    function isPolygon() internal view returns (bool) {
        return block.chainid == POLYGON;
    }

    function isBase() internal view returns (bool) {
        return block.chainid == BASE;
    }

    function isArbitrum() internal view returns (bool) {
        return block.chainid == ARBITRUM;
    }

    function isAvalanche() internal view returns (bool) {
        return block.chainid == AVALANCHE;
    }

    function isMainnet() internal view returns (bool) {
        return isMainnet(block.chainid);
    }

    function isTestnet() internal view returns (bool) {
        return isTestnet(block.chainid);
    }

    function isMainnet(uint256 chainId) internal pure returns (bool) {
        return chainId == ETHEREUM || chainId == OPTIMISM || chainId == BNB || chainId == UNICHAIN || chainId == POLYGON
            || chainId == BASE || chainId == ARBITRUM || chainId == AVALANCHE;
    }

    function isTestnet(uint256 chainId) internal pure returns (bool) {
        return chainId == SEPOLIA || chainId == OPTIMISM_SEPOLIA || chainId == BNB_TESTNET
            || chainId == UNICHAIN_SEPOLIA || chainId == POLYGON_AMOY || chainId == BASE_SEPOLIA
            || chainId == ARBITRUM_SEPOLIA || chainId == AVALANCHE_FUJI;
    }
}
