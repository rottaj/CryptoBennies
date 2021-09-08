const BennyHelper = artifacts.require("BennyHelper");

module.exports = function (deployer) {
    deployer.deploy(BennyHelper);
}