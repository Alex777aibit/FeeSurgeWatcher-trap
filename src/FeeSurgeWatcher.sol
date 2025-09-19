// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ITrap.sol";

/// @title FeeSurgeWatcher
/// @notice Trap contract that monitors sudden changes in block.basefee
contract FeeSurgeWatcher is ITrap {
    uint256 public constant THRESHOLD = 120_000_000; // 0.12 gwei

    /// @notice Collects the current basefee
    function collect() external view override returns (bytes memory) {
        return abi.encode(block.basefee);
    }

    /// @notice Decides if the trap should trigger based on basefee difference
    /// @param data [0] = current value, [1] = previous value (both encoded as uint256)
    function shouldRespond(bytes[] calldata data) external pure override returns (bool, bytes memory) {
        if (data.length < 2) return (false, bytes(""));

        uint256 current = abi.decode(data[0], (uint256));
        uint256 previous = abi.decode(data[1], (uint256));
        uint256 diff = current > previous ? current - previous : previous - current;

        if (diff >= THRESHOLD) {
            return (true, abi.encode(current, previous));
        }
        return (false, bytes(""));
    }
}
