# Foundry Template

A production-ready Foundry template with comprehensive utilities for multi-chain smart contract development, testing, and deployment.

## Features

### Testing Utilities

-   **Chain Management** - Easy chain identification and fork management
-   **Enhanced Deal Function** - Support for rebasing tokens (stETH, eETH) and standard ERC20s
-   **Test Fixtures** - Streamlined contract deployment and test account creation
-   **Fork Utilities** - Time travel, block advancement, and chain-specific test modifiers

### Deployment Utilities

-   **BaseScript** - Comprehensive deployment framework with broadcasting and key management
-   **Interactive Prompts** - CLI prompts for deployment parameters
-   **JSON Tracking** - Automatic deployment artifact generation with addresses and metadata
-   **Multi-Chain Deployment** - Built-in support for deploying across multiple networks

## Quick Start

### Installation

#### Using This Template

Click the [`Use this template`](https://github.com/fomoweth/foundry-template/generate) button at the top of the page to
create a new repository with this repo as the initial state. Or:

#### Foundry

```bash
forge init my-project --template fomoweth/foundry-template
cd my-project
forge install
```

#### Git Clone

```bash
git clone https://github.com/fomoweth/foundry-template.git
cd foundry-template
forge install
```

### Configuration

#### Environment Variables

Create a `.env` file in your project root:

```bash
# Private Key Configuration
PRIVATE_KEY=YOUR_PRIVATE_KEY
# OR use mnemonic
MNEMONIC="YOUR_TWELVE_WORD_MNEMONIC"
EOA_INDEX=0 # Optional (default to 0)

# Etherscan Configuration (for verification)
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_API_KEY

# RPC Provider Configuration

# Using Alchemy
RPC_API_KEY=YOUR_ALCHEMY_API_KEY

ETHEREUM_RPC_URL="https://eth-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
SEPOLIA_RPC_URL="https://eth-sepolia.g.alchemy.com/v2/${RPC_API_KEY}"

OPTIMISM_RPC_URL="https://opt-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
OPTIMISM_SEPOLIA_RPC_URL="https://opt-sepolia.g.alchemy.com/v2/${RPC_API_KEY}"

BNB_RPC_URL="https://bnb-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
BNB_TESTNET_RPC_URL="https://bnb-testnet.g.alchemy.com/v2/${RPC_API_KEY}"

UNICHAIN_RPC_URL="https://unichain-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
UNICHAIN_SEPOLIA_RPC_URL="https://unichain-sepolia.g.alchemy.com/v2/${RPC_API_KEY}"

POLYGON_RPC_URL="https://polygon-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
POLYGON_AMOY_RPC_URL="https://polygon-amoy.g.alchemy.com/v2/${RPC_API_KEY}"

BASE_RPC_URL="https://base-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
BASE_SEPOLIA_RPC_URL="https://base-sepolia.g.alchemy.com/v2/${RPC_API_KEY}"

ARBITRUM_RPC_URL="https://arb-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
ARBITRUM_SEPOLIA_RPC_URL="https://arb-sepolia.g.alchemy.com/v2/${RPC_API_KEY}"

AVALANCHE_RPC_URL="https://avax-mainnet.g.alchemy.com/v2/${RPC_API_KEY}"
AVALANCHE_FUJI_RPC_URL="https://avax-fuji.g.alchemy.com/v2/${RPC_API_KEY}"

# Using Infura
RPC_API_KEY=YOUR_INFURA_API_KEY

ETHEREUM_RPC_URL="https://mainnet.infura.io/v3/${RPC_API_KEY}"
SEPOLIA_RPC_URL="https://sepolia.infura.io/v3/${RPC_API_KEY}"

OPTIMISM_RPC_URL="https://optimism-mainnet.infura.io/v3/${RPC_API_KEY}"
OPTIMISM_SEPOLIA_RPC_URL="https://optimism-sepolia.infura.io/v3/${RPC_API_KEY}"

BNB_RPC_URL="https://bsc-mainnet.infura.io/v3/${RPC_API_KEY}"
BNB_TESTNET_RPC_URL="https://bsc-testnet.infura.io/v3/${RPC_API_KEY}"

UNICHAIN_RPC_URL="https://unichain-mainnet.infura.io/v3/${RPC_API_KEY}"
UNICHAIN_SEPOLIA_RPC_URL="https://unichain-sepolia.infura.io/v3/${RPC_API_KEY}"

POLYGON_RPC_URL="https://polygon-mainnet.infura.io/v3/${RPC_API_KEY}"
POLYGON_AMOY_RPC_URL="https://polygon-amoy.infura.io/v3/${RPC_API_KEY}"

BASE_RPC_URL="https://base-mainnet.infura.io/v3/${RPC_API_KEY}"
BASE_SEPOLIA_RPC_URL="https://base-sepolia.infura.io/v3/${RPC_API_KEY}"

ARBITRUM_RPC_URL="https://arbitrum-mainnet.infura.io/v3/${RPC_API_KEY}"
ARBITRUM_SEPOLIA_RPC_URL="https://arbitrum-sepolia.infura.io/v3/${RPC_API_KEY}"

AVALANCHE_RPC_URL="https://avalanche-mainnet.infura.io/v3/${RPC_API_KEY}"
AVALANCHE_FUJI_RPC_URL="https://avalanche-fuji.infura.io/v3/${RPC_API_KEY}"
```

### Testing

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {BaseTest} from "test/shared/BaseTest.sol";
import {MyContract} from "src/MyContract.sol";

contract MyContractTest is BaseTest {
    MyContract public myContract;

    function setUp() public {
        myContract = new MyContract();
    }

    function test_example() public {
        // Your test logic
    }
}
```

Run tests:

```bash
forge test
forge test -vvv  # Verbose output
forge test --match-test test_example  # Run specific test
```

### Deployment

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {BaseScript} from "script/shared/BaseScript.sol";

contract Deploy is BaseScript {
    function run() external broadcast returns (address) {
        // Your deployment logic
        return address(new MyContract());
    }
}
```

Deploy:

```bash
# Deploy to local Anvil
forge script script/Deploy.s.sol --rpc-url anvil --broadcast

# Deploy to testnet
forge script script/Deploy.s.sol --rpc-url sepolia --broadcast --verify

# Deploy to mainnet
forge script script/Deploy.s.sol --rpc-url ethereum --broadcast --verify
```

## Resources

-   [Foundry Book](https://book.getfoundry.sh/)
-   [Foundry GitHub](https://github.com/foundry-rs/foundry)
-   [Solidity Documentation](https://docs.soliditylang.org/)

---
