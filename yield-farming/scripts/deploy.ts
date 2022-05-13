// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const comptrollerAddress = "0x3d9819210a31b4961b30ef54be2aed79b9c9cd3b";

  const YieldFarmer = await ethers.getContractFactory("YieldFarmer");
  const yieldFarmer = await YieldFarmer.deploy(comptrollerAddress);

  await yieldFarmer.deployed();

  console.log("YieldFarmer deployed to:", yieldFarmer.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
