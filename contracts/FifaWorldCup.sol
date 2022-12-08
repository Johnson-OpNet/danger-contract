// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./EnumDeclaration.sol";
import "./Betting.sol";
import "./UserBalance.sol";

contract FIFAWorldCup is ERC20, Ownable {
    //event NewBet(address addr, uint256 amount);

    Betting private betting;
    UserBalance private userBalance;

    constructor(Betting _betting, UserBalance _userBalance)
        payable
        ERC20("FIFA Token", "FFT")
    {
        betting = _betting;
        userBalance = _userBalance;
    }

    function winnerBrasil() external payable {
        uint amount = msg.value;
        uint share = userBalance.bet(ID_FINAL, Team.Brasil, amount);
        betting.betFinal(amount, share);
    }
}
