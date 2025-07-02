// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {DeployHelper} from "deploy-helper/DeployHelper.sol";
import {Counter} from "../src/Counter.sol";
import {console} from "forge-std/console.sol";

contract DeployCounter is DeployHelper {
    function setUp() public override {
        // Set up with "counter" as the project subfolder
        _setUp("counter");
    }

    function run() public {
        // Deploy Counter contract
        Counter counter = Counter(_deploy(type(Counter).creationCode));

        // Check and set owner for production chains
        _checkChainAndSetOwner(address(counter));

        // Save deployment information
        _afterAll();

        // Log deployment info
        console.log("Counter deployed at:", address(counter));
        console.log("Counter version:", counter.version());
        console.log("Counter owner:", counter.owner());
    }
}
