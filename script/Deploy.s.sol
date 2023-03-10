// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "zora-drops-contracts/ZoraNFTCreatorV1.sol";
import "zora-drops-contracts/ERC721Drop.sol";
import {Strings} from "openzeppelin-contracts/utils/Strings.sol";
import {CheckslistRenderer} from "../src/CheckslistRenderer.sol";

contract Deploy is Script {
    function run() public {
        console.log("Starting ---");

        ZoraNFTCreatorV1 creator = ZoraNFTCreatorV1(
            payable(address(vm.envAddress("ZORA_NFT_CREATOR_ADDRESS")))
        );

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        uint16 ROYALTY_BPS = 250;

        ERC721Drop drop = ERC721Drop(
            payable(address(vm.envAddress("EDITION_ADDRESS")))
        );

        CheckslistRenderer renderer = new CheckslistRenderer(
            "Checkslist",
            "This list may or may not be notable...or done.",
            "ipfs:///bafybeigxtnej7okquznh3bxoj263lg45bhpgv4lfbmbs35jxofuqjer6oy",
            Strings.toString(ROYALTY_BPS),
            string(abi.encodePacked(msg.sender)),
            "https://checkslist.wtf",
            payable(address(vm.envAddress("EDITION_ADDRESS")))
        );

        drop.setMetadataRenderer(renderer, "");

        vm.stopBroadcast();
    }
}
