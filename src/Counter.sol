// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {IVersionable} from "deploy-helper/interfaces/IVersionable.sol";
import {Ownable} from "solady/auth/Ownable.sol";

contract Counter is IVersionable, Ownable {
    string public constant override version = "1.0.5-Counter";

    uint256 public number;

    constructor() {
        _initializeOwner(msg.sender);
    }

    function setNumber(uint256 newNumber) public onlyOwner {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
