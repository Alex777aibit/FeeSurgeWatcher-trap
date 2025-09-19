// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SpikeLogger
/// @notice Contract that logs gas fee spike events
contract SpikeLogger {
    event GasSpike(uint256 current, uint256 previous);

    /// @notice Emits an event when a gas spike occurs
    function logSpike(uint256 current, uint256 previous) external {
        emit GasSpike(current, previous);
    }
}
