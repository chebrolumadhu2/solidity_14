// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SimpleCalendar - a basic on-chain calendar/event manager
/// @author
/// @notice This contract demonstrates creating, updating, deleting and querying calendar events.
/// @dev For production, prefer indexing (events) off-chain (The Graph / logs) for efficient queries.
contract SimpleCalendar {
    uint256 private nextEventId;
    address public owner;

    struct CalendarEvent {
        uint256 id;
        string title;
        uint256 startTimestamp; // unix seconds
        uint256 endTimestamp;   // unix seconds, must be >= startTimestamp
        string description;
        address creator;
        bool recurring;         // simple recurrence flag (true => use intervalDays)
        uint256 intervalDays;   // recurrence interv
