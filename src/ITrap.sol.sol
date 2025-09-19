// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ITrap {
    /// @notice Возвращает собранные данные в байтах
    function collect() external view returns (bytes memory);

    /// @notice Проверяет, нужно ли реагировать
    /// @param data массив собранных данных (например, текущее и предыдущее значения)
    /// @return shouldRespond true/false и закодированные данные ответа
    function shouldRespond(bytes[] calldata data) external pure returns (bool, bytes memory);
}
