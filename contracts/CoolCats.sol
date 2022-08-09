// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoolCats is ERC721, Ownable{

    mapping(uint256 => string) tokenIDtoURI;
    constructor() ERC721("CoolCats", "CCAT") {
        _safeMint(owner(), 0);
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
        tokenIDtoURI[tokenId] = "Qmc4rBWMPEJUM6MueXH4eaUFrbuUW3ZJw95uxnZabiTfM2";
    }
}