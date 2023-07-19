# AugmentedContracts

## Further Resources

[Rust library for writing NEAR smart contracts](https://github.com/near/near-sdk-rs)

[HOW TO CREATE AND DEPLOY SMART CONTRACTS ON THE NEAR PROTOCOL?](https://www.leewayhertz.com/create-smart-contracts-on-near-protocol/)

## Contract Deployments

- Mumbai
    - Escrow with 0xE13F6360eCD6dF96290d5581fAC6ab57B9c5fa56 as admin deployed to 0x4621c9c6dAF8eB5E55a3F50a1aE04F0AeA250809
        ```sh
             hardhat verify --network mumbai 0x4621c9c6dAF8eB5E55a3F50a1aE04F0AeA250809 "0xE13F6360eCD6dF96290d5581fAC6ab57B9c5fa56"
            Successfully submitted source code for contract
            contracts/Escrow.sol:Escrow at 0x4621c9c6dAF8eB5E55a3F50a1aE04F0AeA250809
            for verification on the block explorer. Waiting for verification result...

            Successfully verified contract Escrow on the block explorer.
            https://mumbai.polygonscan.com/address/0x4621c9c6dAF8eB5E55a3F50a1aE04F0AeA250809#code
        ```
    - Token Annotoken [ANN] deployed to 0x276ee636F8080034b98253d232d941C8FfcD35C9
        ```sh
             hardhat verify --network mumbai 0x276ee636F8080034b98253d232d941C8FfcD35C9 "Annotoken" "ANN"
            Successfully submitted source code for contract
            contracts/Token.sol:Token at 0x276ee636F8080034b98253d232d941C8FfcD35C9
            for verification on the block explorer. Waiting for verification result...

            Successfully verified contract Token on the block explorer.
            https://mumbai.polygonscan.com/address/0x276ee636F8080034b98253d232d941C8FfcD35C9#code
        ```