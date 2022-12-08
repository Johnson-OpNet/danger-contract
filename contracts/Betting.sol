// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./EnumDeclaration.sol";

contract Betting {

    struct Event {
        string eventId;
        Team homeTeam;
        Team awayTeam;
        // status could be Unsettled (game haven't start) or winner is HOME or AWAY
        EventStatus status;
        // total amount of all users has bet in this event
        uint256 totalBetAmount;
        // total amount of all users has bet in this event
        uint256 totalShareAmount;
    }

    /**
     * @notice key: eventId, value: Event
     */
    mapping(string => Event) public events;

    constructor() {
        Event memory eventFinal = Event(
            ID_FINAL,
            Team.Brasil,
            Team.England,
            EventStatus.Unsettled,
            0,
            0
        );

        Event memory eventSemiFinal = Event(
            ID_SEMI_FINAL,
            Team.France,
            Team.Portugal,
            EventStatus.Unsettled,
            0,
            0
        );

        events[ID_FINAL] = eventFinal;
        events[ID_SEMI_FINAL] = eventSemiFinal;
    }

    function betFinal(uint _betAmount, uint _shareAmount) external {
        Event storage eventFinal = events[ID_FINAL];
        eventFinal.totalBetAmount += _betAmount;
        eventFinal.totalShareAmount += _shareAmount;
    }

    function betSemiFinal(uint _betAmount, uint _shareAmount) external {
        Event storage eventSemiFinal = events[ID_SEMI_FINAL];
        eventSemiFinal.totalBetAmount += _betAmount;
        eventSemiFinal.totalShareAmount += _shareAmount;
    }
}
