const BennyMigration = artifacts.require("Benny");

module.exports = function (deployer) {
    deployer.deploy(BennyMigration);
}