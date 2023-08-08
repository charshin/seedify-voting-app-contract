async function main() {
  const VotingApp = await ethers.getContractFactory("VotingApp");
  const voting_app = await VotingApp.deploy();
  console.log("Contract Deployed to Address:", voting_app.address);
}
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });