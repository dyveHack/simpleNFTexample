// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoolCats is ERC721, Ownable{

    mapping(uint256 => string) tokenIDtoURI;
    constructor() ERC721("CoolCats", "CCAT") {
        // Mint to deployer all the coolcats
        for (uint i; i < 11; i++)
            _safeMint(owner(), i);
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
            tokenIDtoURI[tokenId] = "Qme2z9nd2LgA9pzucxuSubM9hu4mWZnoUyEtzev8jNNzdo";
        } else if (tokenId == 1) {
            tokenIDtoURI[tokenId] = "QmReh3tArXA7Mi7TmHYHD7Q6kHMZPZ1jsxCHVATdyeC4Go";
        } else if (tokenId == 2) {
            tokenIDtoURI[tokenId] = "QmYm9s39jnqpVQwkmPt2uxavw6k54QGgt93EYcKaNKgprM";
        } else if (tokenId == 3) {
            tokenIDtoURI[tokenId] = "QmRtTbDzgHgqjGMnZDS7VWMAwyyx8tvhMf75oiGNEggkBP";
        } else if (tokenId == 4) {
            tokenIDtoURI[tokenId] = "QmcSM5PMaeM14reNcMKytV9isxd1y7XsNWMV6S42Ye3WGr";
        } else if (tokenId == 5) {
            tokenIDtoURI[tokenId] = "QmXdUfBuM7T6vyfiotYUhPGWJbuUtcGzJV1MDqb6unmLyK";
        } else if (tokenId == 6) {
            tokenIDtoURI[tokenId] = "QmZJxApd4ys2j5ZsJsLNzMS4e14JP6AAYbbbw27fWZe6mg";
        } else if (tokenId == 7) {
            tokenIDtoURI[tokenId] = "QmV8uo9NvGsmwUisMcWJJBVWDoHCcXTtiaZiwbvzxFD4fZ";
        } else if (tokenId == 8) {
            tokenIDtoURI[tokenId] = "QmexgcjchPKzNwF5GqRQkbxcDdQtgQd5co615sUfhySh1r";
        } else if (tokenId == 9) {
            tokenIDtoURI[tokenId] = "QmVTpTw9iykttus8TpEowYv7Zt9FMG3q4Xhg9dwfb8zi9u";
        } else if (tokenId == 10) {
            tokenIDtoURI[tokenId] = "Qmex9EYGuFws1WQ9yZ6MJXgRxHfa3Wqcom7LT2VVVLFhh7";
        } else {
            revert("Collection does not contain this ID!");
        }
    }
}