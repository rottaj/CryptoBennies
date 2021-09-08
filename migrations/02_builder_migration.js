const BuilderMigration = artifacts.require("BennyBuilder");

module.exports = function (deployer) {
    deployer.deploy(BuilderMigration);
}