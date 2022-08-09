const hre = require("hardhat");

async function main() {

  const CoolCats = await hre.ethers.getContractFactory("CoolCats");
  const coolCats = await CoolCats.deploy();

  await coolCats.deployed();

  console.log(
    `CoolCats deployed to ${coolCats.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
