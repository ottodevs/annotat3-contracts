// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Escrow is ReentrancyGuard {
    address public admin;

    uint public distributionTimeframe = 10 minutes;

    uint public lastDistributionTimestamp;

    struct User {
        uint128 active;  // if the user is active
        uint128 score; // total earned
    }

    mapping(address => User) users;

    address[] public usersList;

    event MultiSent(uint _total, address _token);
    event UserCreated(address indexed user);

    modifier onlyOwner() {
        require(msg.sender == admin, "Only Owner");
        _;
    }

    constructor(address _router) {
        admin = _router;
    }

    function createUser(address userAddress) external onlyOwner{
        require(
            userAddress != address(0),
            'Invalid token contract address'
        );
        require(
            users[userAddress].active != 0,
            'Active Account'
        );
        users[userAddress].active = 1;
        users[userAddress].score = 0;
        usersList.push(userAddress);
        emit UserCreated(userAddress);
    }


    function queryUser(address userAddress) view external returns (uint128, uint128) {
        require(
            userAddress != address(0),
            'Invalid token contract address'
        );
        return (users[userAddress].active, users[userAddress].score);
    }


    function multisendToken(address token, address[] calldata _contributors, uint256[] calldata _balances) public payable {
        require(msg.sender == admin, "You aren't the owner");
        require(block.timestamp >= (lastDistributionTimestamp + 10 minutes));
        uint total;
        uint lengthContributors = _contributors.length;
        ERC20 erc20token = ERC20(token);
        for (uint i; i != lengthContributors; ) {
            erc20token.transfer(_contributors[i], _balances[i]);
            total += _balances[i];
            unchecked{++i;}
        }
        lastDistributionTimestamp = block.timestamp;
        emit MultiSent(total, token);
    }


    function changeDistributionTimeframe(uint timeframe) public onlyOwner {
        distributionTimeframe = timeframe;
    }

    function changeOwner(address newOwner) public onlyOwner {
        admin = newOwner;
    }

}
