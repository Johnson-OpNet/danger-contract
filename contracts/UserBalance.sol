// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./EnumDeclaration.sol";

contract UserBalance {
    uint256 bonus2Pct = 10**17;
    uint256 bonus6Pct = 50**17;
    uint256 bonus8Pct = 1 ether;

    struct Selection {
        // key: Team, value: user's total shareAmount by betting team
        mapping(Team => uint256) shareAmounts;
    }

    struct BetInfo {
        // key: eventId, value: user's selection
        mapping(string => Selection) selections;
    }

    /**
     * @notice key: user address, value: user's bet info
     */
    //mapping(address => BetInfo) userBetInfos;

    mapping(address => mapping(string => mapping(Team => uint256))) userBetInfos;

    function bet(
        string calldata eventId,
        Team team,
        uint256 amount
    ) public returns (uint256) {
        require(amount > 0, "Bet amount must greater than 0");
        require((amount / 10000) * 10000 == amount, "Bet amount too small");
        uint256 bonus = 0;
        if (amount >= bonus8Pct) {
            bonus = (amount * 800) / 10000;
        } else if (amount >= bonus6Pct) {
            bonus = (amount * 600) / 10000;
        } else if (amount >= bonus2Pct) {
            bonus = (amount * 200) / 10000;
        }
        amount = amount + bonus;
        userBetInfos[msg.sender][eventId][team] += amount;
        return amount;
    }
}
