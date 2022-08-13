<h1>The Cool Cats Collection</h1>

![Cool Cats are cool by nature. The IPFS of this Cool Cat image: Qmc4rBWMPEJUM6MueXH4eaUFrbuUW3ZJw95uxnZabiTfM2](coolcat.jpeg?raw=true "Cool Cats")

FIRST: This was as uper rushed implementation at a Hackathon and was *not* the deliverable and also not the priority. For a better example on how to implement an NFT collection that is also scalable see this: https://github.com/jesperkristensen58/BoredCatsNFTCollection.

This was created via IPFS on the command line with:

    ipfs init
    ipfs daemon
    ipfs add <local path to file> # NOTE: Take note of the path to the image!
    ipfs add nft.json

Where nft.json contained the image details and the path to the image like this:

    {
      "name": "NFT Art",
      "description": "Pretty cool cat.",
      "image": "https://ipfs.io/ipfs/QmXGj2CEw5aLFcH9W7izh3fyr3he4RTnEcBDtPnohHt5P2"
    }

The collection contains only 2 elements at this time and was built as a test Collection at ETH Toronto 2022.
