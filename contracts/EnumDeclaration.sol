// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

string constant ID_FINAL = "final";
string constant ID_SEMI_FINAL = "semi_final";

enum Team {
    Brasil,
    England,
    France,
    Portugal
}

enum EventStatus {
    Unsettled,
    Home,
    Away
}
