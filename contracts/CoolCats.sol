// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoolCats is ERC721, Ownable{

    mapping(uint256 => string) tokenIDtoURI;
    constructor() ERC721("CoolCats", "CCAT") {
        _safeMint(owner(), 0);
        _safeMint(owner(), 1);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireMinted(tokenId);

        string memory _tokenURI = tokenIDtoURI[tokenId];

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, _tokenURI)) : "";
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override {
        super._beforeTokenTransfer(from, to, tokenId);
        
        if (tokenId == 0) {
            tokenIDtoURI[0] = "Qmc4rBWMPEJUM6MueXH4eaUFrbuUW3ZJw95uxnZabiTfM2";
        } else if (tokenId == 1) {
            tokenIDtoURI[1] = "QmXmUrA5SYtGqQzi5QeCZythuQBC8xZr2JLJRnf7d3eENM";
        } else {
            revert("Collection does not contain this ID!");
        }
    }
}