package com.megster.cordova;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.AsyncTask;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.util.Log;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.LOG;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.Arrays;


/**
 * PhoneGap Plugin for Serial Communication over Bluetooth
 */
public class BluetoothSerial extends CordovaPlugin {

    // actions
    private static final String LIST = "list";
    private static final String CONNECT = "connect";
    private static final String CONNECT_INSECURE = "connectInsecure";
    private static final String DISCONNECT = "disconnect";
    private static final String WRITE = "write";
    private static final String AVAILABLE = "available";
    private static final String READ = "read";
    private static final String READ_UNTIL = "readUntil";
    private static final String SUBSCRIBE = "subscribe";
    private static final String UNSUBSCRIBE = "unsubscribe";
    private static final String SUBSCRIBE_RAW = "subscribeRaw";
    private static final String UNSUBSCRIBE_RAW = "unsubscribeRaw";
    private static final String IS_ENABLED = "isEnabled";
    private static final String IS_CONNECTED = "isConnected";
    private static final String CLEAR = "clear";
    private static final String SETTINGS = "showBluetoothSettings";
    private static final String ENABLE = "enable";
    private static final String DISCOVER_UNPAIRED = "discoverUnpaired";
    private static final String SET_DEVICE_DISCOVERED_LISTENER = "setDeviceDiscoveredListener";
    private static final String CLEAR_DEVICE_DISCOVERED_LISTENER = "clearDeviceDiscoveredListener";
    private static final String WRITE_BINARY = "writebinary";
    // callbacks
    private CallbackContext connectCallback;
    private CallbackContext dataAvailableCallback;
    private CallbackContext rawDataAvailableCallback;
    private CallbackContext enableBluetoothCallback;
    private CallbackContext deviceDiscoveredCallback;

    private BluetoothAdapter bluetoothAdapter;
    private BluetoothSerialService bluetoothSerialService;

    // Debugging
    private static final String TAG = "BluetoothSerial";
    private static final boolean D = true;

    // Message types sent from the BluetoothSerialService Handler
    public static final int MESSAGE_STATE_CHANGE = 1;
    public static final int MESSAGE_READ = 2;
    public static final int MESSAGE_WRITE = 3;
    public static final int MESSAGE_DEVICE_NAME = 4;
    public static final int MESSAGE_TOAST = 5;
    public static final int MESSAGE_READ_RAW = 6;

    // Key names received from the BluetoothChatService Handler
    public static final String DEVICE_NAME = "device_name";
    public static final String TOAST = "toast";

    StringBuffer buffer = new StringBuffer();
    private String delimiter;
    private static final int REQUEST_ENABLE_BLUETOOTH = 1;

    @Override
    public boolean execute(String action, CordovaArgs args, CallbackContext callbackContext) throws JSONException {

        LOG.d(TAG, "*********action = " + action);

        if (bluetoothAdapter == null) {
            bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        }

        if (bluetoothSerialService == null) {
            bluetoothSerialService = new BluetoothSerialService(mHandler);
        }

        boolean validAction = true;

        if (action.equals(LIST)) {

            listBondedDevices(callbackContext);

        } else if (action.equals(CONNECT)) {

            boolean secure = true;
            connect(args, secure, callbackContext);

        } else if (action.equals(CONNECT_INSECURE)) {

            // see Android docs about Insecure RFCOMM http://goo.gl/1mFjZY
            boolean secure = false;
            connect(args, secure, callbackContext);

        } else if (action.equals(DISCONNECT)) {

            connectCallback = null;
            bluetoothSerialService.stop();
            callbackContext.success();

        } else if (action.equals(WRITE)) {
            buffer.setLength(0);
          //  byte[] data = args.getArrayBuffer(0);
            String dataString = args.getString(0);

            Log.d("[BluetoothSerial SEND]","dato hexString_yo: "+  strToBin(dataString));
            bluetoothSerialService.write(strToBin(dataString));
            callbackContext.success();

        }else if (action.equals(WRITE_BINARY)) {
            buffer.setLength(0);
            //  byte[] data = args.getArrayBuffer(0);
            String dataString = args.getString(0);
            String sizeDataString = args.getString(1);
            int sizeData = Integer.parseInt (sizeDataString);
            String dataTMP = new String();
            int charCode = 0;
            int index = 0;
            byte[] bTmp = new byte[sizeData];

            List<String> listaTMP = new ArrayList<String>();

            for (String retval: dataString.split(" ")) {

                listaTMP.add(retval);
                charCode = Integer.parseInt(retval, 2);

                //BigInteger bi = BigInteger.valueOf(256);

                bTmp[index] = (byte)Short.parseShort(retval, 2);
                String str = new Character((char)charCode).toString();
                dataTMP = dataTMP.concat(str);
                index++;

            }

            Log.d("[BluetoothSerial SEND]","dato hexString_yo_WRITE_BINARY): "+  dataString);
            Log.d("[BluetoothSerial SEND]","dato hexString_yo_WRITE_BINARY): "+  listaTMP);
            Log.d("[BluetoothSerial SEND]","dato hexString_yo_WRITE_BINARY): "+  dataTMP);
            Log.d("[BluetoothSerial SEND]","dato hexString_yo_WRITE_BINARY): "+  dataTMP.length());
            Log.d("[BluetoothSerial SEND]","dato hexString_yo_WRITE_BINARY): "+  bTmp.length);
            bluetoothSerialService.write(/*strToBin(dataTMP)*/bTmp);
            callbackContext.success();

        } else if (action.equals(AVAILABLE)) {

            callbackContext.success(available());

        } else if (action.equals(READ)) {

            callbackContext.success(read());

        } else if (action.equals(READ_UNTIL)) {

            String interesting = args.getString(0);
            callbackContext.success(readUntil(interesting));

        } else if (action.equals(SUBSCRIBE)) {

            rawDataAvailableCallback = callbackContext;

            PluginResult result = new PluginResult(PluginResult.Status.NO_RESULT);
            result.setKeepCallback(true);
            callbackContext.sendPluginResult(result);

            /*
            delimiter = args.getString(0);
            dataAvailableCallback = callbackContext;

            PluginResult result = new PluginResult(PluginResult.Status.NO_RESULT);
            result.setKeepCallback(true);
            callbackContext.sendPluginResult(result);
            */
        } else if (action.equals(UNSUBSCRIBE)) {

            delimiter = null;

            // send no result, so Cordova won't hold onto the data available callback anymore
 /*           PluginResult result = new PluginResult(PluginResult.Status.NO_RESULT);
            dataAvailableCallback.sendPluginResult(result);
            dataAvailableCallback = null;
*/
            callbackContext.success();

            rawDataAvailableCallback = callbackContext;

            callbackContext.success();

        } else if (action.equals(SUBSCRIBE_RAW)) {

            rawDataAvailableCallback = callbackContext;

            PluginResult result = new PluginResult(PluginResult.Status.NO_RESULT);
            result.setKeepCallback(true);
            callbackContext.sendPluginResult(result);

        } else if (action.equals(UNSUBSCRIBE_RAW)) {

            rawDataAvailableCallback = callbackContext;

            callbackContext.success();

        } else if (action.equals(IS_ENABLED)) {

            if (bluetoothAdapter.isEnabled()) {
                callbackContext.success();
            } else {
                callbackContext.error("Bluetooth is disabled.");
            }

        } else if (action.equals(IS_CONNECTED)) {

            if (bluetoothSerialService.getState() == BluetoothSerialService.STATE_CONNECTED) {
                callbackContext.success();
            } else {
                callbackContext.error("Not connected.");
            }

        } else if (action.equals(CLEAR)) {

            buffer.setLength(0);
            callbackContext.success();

        } else if (action.equals(SETTINGS)) {

            Intent intent = new Intent(Settings.ACTION_BLUETOOTH_SETTINGS);
            cordova.getActivity().startActivity(intent);
            callbackContext.success();

        } else if (action.equals(ENABLE)) {

            enableBluetoothCallback = callbackContext;
            Intent intent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            cordova.startActivityForResult(this, intent, REQUEST_ENABLE_BLUETOOTH);

        } else if (action.equals(DISCOVER_UNPAIRED)) {

            discoverUnpairedDevices(callbackContext);

        } else if (action.equals(SET_DEVICE_DISCOVERED_LISTENER)) {

            this.deviceDiscoveredCallback = callbackContext;

        } else if (action.equals(CLEAR_DEVICE_DISCOVERED_LISTENER)) {

            this.deviceDiscoveredCallback = null;

        } else {
            validAction = false;

        }

        return validAction;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {

        if (requestCode == REQUEST_ENABLE_BLUETOOTH) {

            if (resultCode == Activity.RESULT_OK) {
                Log.d(TAG, "User enabled Bluetooth");
                if (enableBluetoothCallback != null) {
                    enableBluetoothCallback.success();
                }
            } else {
                Log.d(TAG, "User did *NOT* enable Bluetooth");
                if (enableBluetoothCallback != null) {
                    enableBluetoothCallback.error("User did not enable Bluetooth");
                }
            }

            enableBluetoothCallback = null;
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (bluetoothSerialService != null) {
            bluetoothSerialService.stop();
        }
    }
    public  int toByte(int number) {
        int tmp = number & 0xff;
        if ((tmp & 0x80) == 0x80) {
            int bit = 1;
            int mask = 0;
            for(;;) {
                mask |= bit;
                if ((tmp & bit) == 0) {
                    bit <<=1;
                    continue;
                }
                int left = tmp & (~mask);
                int right = tmp & mask;
                left = ~left;
                left &= (~mask);
                tmp = left | right;
                tmp = -(tmp & 0xff);
                break;
            }
        }
        return tmp;
    }
    private void listBondedDevices(CallbackContext callbackContext) throws JSONException {
        JSONArray deviceList = new JSONArray();
        Set<BluetoothDevice> bondedDevices = bluetoothAdapter.getBondedDevices();

        for (BluetoothDevice device : bondedDevices) {
            deviceList.put(deviceToJSON(device));
        }
        callbackContext.success(deviceList);
    }

    private void discoverUnpairedDevices(final CallbackContext callbackContext) throws JSONException {

        final CallbackContext ddc = deviceDiscoveredCallback;

        final BroadcastReceiver discoverReceiver = new BroadcastReceiver() {

            private JSONArray unpairedDevices = new JSONArray();

            public void onReceive(Context context, Intent intent) {
                String action = intent.getAction();
                if (BluetoothDevice.ACTION_FOUND.equals(action)) {
                    BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    try {
                        JSONObject o = deviceToJSON(device);
                        unpairedDevices.put(o);
                        if (ddc != null) {
                            PluginResult res = new PluginResult(PluginResult.Status.OK, o);
                            res.setKeepCallback(true);
                            ddc.sendPluginResult(res);
                        }
                    } catch (JSONException e) {
                        // This shouldn't happen, log and ignore
                        Log.e(TAG, "Problem converting device to JSON", e);
                    }
                } else if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED.equals(action)) {
                    callbackContext.success(unpairedDevices);
                    cordova.getActivity().unregisterReceiver(this);
                }
            }
        };

        Activity activity = cordova.getActivity();
        activity.registerReceiver(discoverReceiver, new IntentFilter(BluetoothDevice.ACTION_FOUND));
        activity.registerReceiver(discoverReceiver, new IntentFilter(BluetoothAdapter.ACTION_DISCOVERY_FINISHED));
        bluetoothAdapter.startDiscovery();
    }

    private JSONObject deviceToJSON(BluetoothDevice device) throws JSONException {
        JSONObject json = new JSONObject();
        json.put("name", device.getName());
        json.put("address", device.getAddress());
        json.put("id", device.getAddress());
        if (device.getBluetoothClass() != null) {
            json.put("class", device.getBluetoothClass().getDeviceClass());
        }
        return json;
    }

    private void connect(CordovaArgs args, boolean secure, CallbackContext callbackContext) throws JSONException {
        String macAddress = args.getString(0);
        BluetoothDevice device = bluetoothAdapter.getRemoteDevice(macAddress);

        if (device != null) {
            connectCallback = callbackContext;
            bluetoothSerialService.connect(device, secure);

            PluginResult result = new PluginResult(PluginResult.Status.NO_RESULT);
            result.setKeepCallback(true);
            callbackContext.sendPluginResult(result);

        } else {
            callbackContext.error("Could not connect to " + macAddress);
        }
    }

    // The Handler that gets information back from the BluetoothSerialService
    // Original code used handler for the because it was talking to the UI.
    // Consider replacing with normal callbacks
    private final Handler mHandler = new Handler() {

         public void handleMessage(Message msg) {
             switch (msg.what) {
                 case MESSAGE_READ:
                    buffer.append((String)msg.obj);

                    if (dataAvailableCallback != null) {
                        sendDataToSubscriber();
                    }

                    break;
                 case MESSAGE_READ_RAW:
                    if (rawDataAvailableCallback != null) {
                        byte[] bytes = (byte[]) msg.obj;
                        sendRawDataToSubscriber(bytes);
                    }
                    break;
                 case MESSAGE_STATE_CHANGE:

                    if(D) Log.i(TAG, "MESSAGE_STATE_CHANGE: " + msg.arg1);
                    switch (msg.arg1) {
                        case BluetoothSerialService.STATE_CONNECTED:
                            Log.i(TAG, "BluetoothSerialService.STATE_CONNECTED");
                            notifyConnectionSuccess();
                            break;
                        case BluetoothSerialService.STATE_CONNECTING:
                            Log.i(TAG, "BluetoothSerialService.STATE_CONNECTING");
                            break;
                        case BluetoothSerialService.STATE_LISTEN:
                            Log.i(TAG, "BluetoothSerialService.STATE_LISTEN");
                            break;
                        case BluetoothSerialService.STATE_NONE:
                            Log.i(TAG, "BluetoothSerialService.STATE_NONE");
                            break;
                    }
                    break;
                case MESSAGE_WRITE:
                    //  byte[] writeBuf = (byte[]) msg.obj;
                    //  String writeMessage = new String(writeBuf);
                    //  Log.i(TAG, "Wrote: " + writeMessage);
                    break;
                case MESSAGE_DEVICE_NAME:
                    Log.i(TAG, msg.getData().getString(DEVICE_NAME));
                    break;
                case MESSAGE_TOAST:
                    String message = msg.getData().getString(TOAST);
                    notifyConnectionLost(message);
                    break;
             }
         }
    };

    private void notifyConnectionLost(String error) {
        if (connectCallback != null) {
            connectCallback.error(error);
            connectCallback = null;
        }
    }

    private void notifyConnectionSuccess() {
        if (connectCallback != null) {
            PluginResult result = new PluginResult(PluginResult.Status.OK);
            result.setKeepCallback(true);
            connectCallback.sendPluginResult(result);
        }
    }
    private int timeout=50;

    private void sendRawDataToSubscriber(byte[] data) {
        final String dataString = byte2hex(data);
        dataString.replace(" ","");
        Log.d("[BluetoothSerial READ]", "RAW DATASubscriber Dato llegada: " + dataString);

        if (data != null && data.length > 0) {

            new Thread(
                    new Runnable() {
                        @Override
                        public void run() {
                            timeout+=100;
                            new Timeout(dataString,rawDataAvailableCallback).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                        }
                    }
            ).start();



                 /*  PluginResult result = new PluginResult(PluginResult.Status.OK, dataString);
                   result.setKeepCallback(true);
                   rawDataAvailableCallback.sendPluginResult(result);*/


        }
    }

    private class Timeout extends AsyncTask<String, Void, Void> {
        private  String dataString;
        private  CallbackContext rawDataAvailableCallback;
        public Timeout (String dataString,  CallbackContext rawDataAvailableCallback)
        {
            this.dataString=dataString;
            this.rawDataAvailableCallback= rawDataAvailableCallback;
        }

        @Override
        protected Void doInBackground(String... params) {

            try {
             Log.i(TAG, "Going to sleep" +dataString);
            Thread.sleep(timeout);

            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void rta) {
            super.onPostExecute(rta);
            timeout-=100;
            Log.i(TAG, "Luego del sleep"+dataString);
            PluginResult result = new PluginResult(PluginResult.Status.OK, dataString);
            result.setKeepCallback(true);
            rawDataAvailableCallback.sendPluginResult(result);
        }
    }



    private void sendDataToSubscriber() {

        String data = readUntil(delimiter);
        if (data != null && data.length() > 0) {
            PluginResult result = new PluginResult(PluginResult.Status.OK, data);
            result.setKeepCallback(true);
            dataAvailableCallback.sendPluginResult(result);

            sendDataToSubscriber();
        }
    }

    private int available() {
        return buffer.length();
    }

    private String read() {
        int length = buffer.length();
        String data = buffer.substring(0, length);
        buffer.delete(0, length);
        return data;
    }

    private String readUntil(String c) {
        String data = "";
        int index = buffer.indexOf(c, 0);
        if (index > -1) {
            data = buffer.substring(0, index + c.length());
            buffer.delete(0, index + c.length());
        }
        return data;
    }
        public static String byte2hex(byte[] b, int length) {
        return byte2hex(Arrays.copyOfRange(b, 0, length));
    }

    // Convert Byte Arrary to Hex String
    public static String byte2hex(byte[] b) {
        // String Buffer can be used instead
        String hs = "";
        String stmp = "";
        for (int n = 0; n < b.length; n++) {
            stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1) {
                hs = hs + "0" + stmp + " ";
            } else {
                hs = hs + stmp + " ";
            }
            if (n < b.length - 1) {
                hs = hs + "";
            }
        }
        return hs;
    }




 /**
     * Convert String to Binary Array Data
     *
     * @param strData
     *            The String to convert.
     *
     * @return If null is convert error, else is convert binary array data.
     */

    public byte[] strToBin(String strData) {
        byte[] bTmp;
        byte[] bData;
        int iData = 0;

        if (strData == null) {
            bData = null;
        } else {
            bTmp = strData.getBytes();
            if (bTmp.length % 2 != 0)
                bData = new byte[bTmp.length / 2 + 1];
            else
                bData = new byte[bTmp.length / 2];

            for (int index = 0; index < bTmp.length; index += 2) {
                if (index + 1 == bTmp.length)
                    bData[iData] = combinHex((byte) 0x00, bTmp[index]);
                else
                    bData[iData] = combinHex(bTmp[index], bTmp[index + 1]);

                iData += 1;
            }
        }

        return bData;
    }

    private byte combinHex(byte bHigh, byte bLow) {
        byte bHex = 0;

        bHex = ascToDec(bHigh);
        bHex <<= 4;
        bHex += ascToDec(bLow);

        return bHex;
    }

    private byte ascToDec(byte bData) {
        byte bHex = 0;

        if (bData >= (byte) 0x41 && bData <= (byte) 0x46) // A-F
            bHex = (byte) (bData - (byte) 0x37);
        else if (bData >= (byte) 0x61 && bData <= (byte) 0x66) // a-f
            bHex = (byte) (bData - (byte) 0x57);
        else if (bData >= (byte) 0x30 && bData <= (byte) 0x39) // 0-9
            bHex = (byte) (bData - (byte) 0x30);
        else
            bHex = 0;

        return bHex;
    }

}