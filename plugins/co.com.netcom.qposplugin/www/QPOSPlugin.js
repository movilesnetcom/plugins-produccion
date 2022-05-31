cordova.define("co.com.netcom.qposplugin.QPOSPlugin", function(require, exports, module) {
    var exec = require('cordova/exec');

    /*Callback class allowing devs to easily call native QPOSPlugin class<br>
     setProperties(action, sucess, error) to set the class on one particular action<br>
     cordovaCall(args) to execute the native function with needed args*/

    function CallbackClass() {}

    CallbackClass.prototype = {
        setProperties: function(action, success, error) {
            if (!(typeof action == "string"))
                throw new Error("param action has to be a string");
            if (!(typeof success == "function"))
                throw new Error("param error has to be a function");
            if (!(typeof error == "function"))
                throw new Error("param success has to be a function");

            this.errorCallback = error;
            this.successCallback = success;
            this.action = action;
        },

        error: function() {
            console.log(action + " : error");
            errorCallback();
        },

        success: function() {
            console.log(action + " : success");
            successCallback();
        },

        cordovaCall: function() {
            console.log("call " + this.action);

            var args = Array.prototype.slice.call(arguments);

            var argsList = "{";
            for (var i = 0; i < args.length; i++)
                argsList += "(" + args[i].toString() + "); ";
            argsList += "}";

            console.log("args=" + argsList);

            return cordova.exec(this.successCallback, this.errorCallback, "QPOSPlugin", this.action, args);
        }
    }
    var callback = new CallbackClass();

    /**
     * Interface with the Native RP75Plugin.
     *
     * @class QPOSPluginClass
     *
     */
    function QPOSPluginClass() {}
    QPOSPluginClass.prototype = {

        /**
         * Get a list of all the paired companions.
         *
         * @method QPOS_GetCompanions
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {JSONArray} Array of each companions define as string below: "parameter1,parameter2,parameter3". Parameter1 contain "Activated" or is empty, Parameter2 contain name of companion, Parameter3 contain address of companion </br></br> String: </br></br> Error executing the function: ERROR_WHILE_GETTING_COMPANION_PAIRED
         */
        QPOS_GetCompanions: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_GetCompanions", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Connect whit the device paired companions select
         *
         * @method QPOS_ConectTerminal
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @param companion {String} Address of companion to connect
         * @return {String} Error executing the function: ERROR_WHILE_ACTIVATE_COMPANION
         */
        QPOS_ConnectDevice: function(callbackOk, callbackKo, companionId) {
            callback.setProperties("QPOS_getConnectDevice", callbackOk, callbackKo);
            return callback.cordovaCall(companionId);
        },

        /**
         * Disconnect whit device paired
         *
         * @method QPOS_DisconnectDevice
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_DISABLES_COMPANION
         */
        QPOS_DisconnectDevice: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_DisconnectDevice", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Validate connection status with the device
         *
         * @method QPOS_IsConnectedDevice
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_ACTIVATE_COMPANION
         */
        QPOS_IsConnectedDevice: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_IsConnectDevice", callbackOk, callbackKo);
            return callback.cordovaCall();
        },
        /**
         * Validate status Battery with the device
         *
         * @method QPOS_IsConnectedDevice
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_ACTIVATE_COMPANION
         */
        QPOS_GetStatusBattery: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_GetStatusBattery", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Start full flow test for sale EMV chip.
         *
         * @method QPOS_StartTransacionTest
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} The data of card, Error executing the function: ERROR_WHILE_START_TRANSACION_SALE
         */
        QPOS_StartTransacionTest: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_StartTransacionTest", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Set-up of keys for the device.
         *
         * @method QPOS_ConfigurationInitial
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_GETTING_CONFIGURATION
         */
        QPOS_ConfigurationInitial: function(callbackOk, callbackKo, pathBin) {
            callback.setProperties("QPOS_ConfigurationInitial", callbackOk, callbackKo);
            return callback.cordovaCall(pathBin);
        },
        QPOS_ConfigurationInitialmini: function(callbackOk, callbackKo, xmlmini) {
            callback.setProperties("updateEMVConfigForQPOSmini", callbackOk, callbackKo);
            return callback.cordovaCall(xmlmini);
        },
        QPOS_ConfigurationInitialcute: function(callbackOk, callbackKo, xmlcute) {
            callback.setProperties("updateEMVConfigForQPOScute", callbackOk, callbackKo);
            return callback.cordovaCall(xmlcute);
        },

        /**
         * Start transaction, execute command.
         *
         * @method QPOS_StartTransaction
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} The data of card, Error executing the function: ERROR_WHILE_EXECUTE_START_TRANSACTION
         */
        QPOS_StartTransaction: function(callbackOk, callbackKo, command) {
            callback.setProperties("QPOS_StartTransaction", callbackOk, callbackKo);
            return callback.cordovaCall(command);
        },

        /**
         * Execute command DataTransaction
         *
         * @method QPOS_DataTransaction
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} The data of card, Error executing the function: ERROR_WHILE_EXECUTE_DATA_TRANSACTION
         */
        QPOS_DataTransaction: function(callbackOk, callbackKo, data) {
            callback.setProperties("QPOS_DataTransaction", callbackOk, callbackKo);
            return callback.cordovaCall(data);
        },

        /**
         * Execute command CompleteTransaction
         *
         * @method QPOS_CompleteTransaction
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} The data of card, Error executing the function: ERROR_WHILE_COMPLETE_COMPANION.
         */
        QPOS_CompleteTransaction: function(callbackOk, callbackKo, data) {
            callback.setProperties("QPOS_CompleteTransaction", callbackOk, callbackKo);
            return callback.cordovaCall(data);
        },

        /**
         * Execute command StopTransaction
         *
         * @method QPOS_StopTransaction
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_STOP_TRANSACTION
         */
        QPOS_StopTransaction: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_StopTransaction", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Execute command StopTransaction
         *
         * @method QPOS_StopTransaction
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_STOP_TRANSACTION
         */
        QPOS_IsInsertCard: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_IsInsertCard", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Method to ask pin per screen, band card
         *
         * @method QPOS_BandCardPin
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_ASK_PIN
         */
        QPOS_BandCardPin: function(callbackOk, callbackKo, lastFour) {
            callback.setProperties("QPOS_BandCardPin", callbackOk, callbackKo);
            return callback.cordovaCall(lastFour);
        },

        /**
         * Waiting time for command execution
         *
         * @method QPOS_TimeOut
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_TIMEOUT
         */
        QPOS_TimeOut: function(callbackOk, callbackKo, timeout) {
            callback.setProperties("QPOS_TimeOut", callbackOk, callbackKo);
            return callback.cordovaCall(timeout);
        },

        /**
         * Method to configure Display control on the device
         *
         * @method QPOS_DisplayControl
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_DISPLAY_CONTROL
         */
        QPOS_ClearDisplay: function(callbackOk, callbackKo) {
            callback.setProperties("QPOS_ClearDisplay", callbackOk, callbackKo);
            return callback.cordovaCall();
        },

        /**
         * Method to write on the device screen.
         *
         * @method QPOS_DisplayText
         * @param callbackOk {Function} Method that will be called if the function is successfully
         * @param callbackKo {Function} Method that will be called if the function ends in error
         * @return {String} Error executing the function: ERROR_WHILE_DISPLAY_TEXT
         */
        QPOS_DisplayText: function(callbackOk, callbackKo, text) {
            callback.setProperties("QPOS_DisplayText", callbackOk, callbackKo);
            return callback.cordovaCall(text);
        }

    }

    var PCLPlugin = new QPOSPluginClass();
    module.exports = PCLPlugin;
});