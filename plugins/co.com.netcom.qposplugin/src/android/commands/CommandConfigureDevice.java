package co.com.netcom.qposplugin.android.commands;


import com.dspread.xpos.EmvAppTag;
import com.dspread.xpos.EmvCapkTag;

import java.util.ArrayList;

import co.com.netcom.qposplugin.android.constants.ConstantsKeyEmv;
import co.com.netcom.qposplugin.android.dto.EmvKeyDTO;

/**
 * Created by movilesequipo1 on 12/04/18.
 */
public class CommandConfigureDevice {

    private boolean isTest = true;
    public ArrayList<EmvKeyDTO> getKeysConfigure(){

        ArrayList<EmvKeyDTO> list = new ArrayList<EmvKeyDTO>();
        if(isTest){
            list.add(ConstantsKeyEmv.TEST_KEY1);
            list.add(ConstantsKeyEmv.TEST_KEY2);
            list.add(ConstantsKeyEmv.TEST_KEY3);
            list.add(ConstantsKeyEmv.TEST_KEY4);
            list.add(ConstantsKeyEmv.TEST_KEY5);
            list.add(ConstantsKeyEmv.TEST_KEY6);
            list.add(ConstantsKeyEmv.TEST_KEY7);
            list.add(ConstantsKeyEmv.TEST_KEY8);
            list.add(ConstantsKeyEmv.TEST_KEY9);
            list.add(ConstantsKeyEmv.TEST_KEY10);
            list.add(ConstantsKeyEmv.TEST_KEY11);
            list.add(ConstantsKeyEmv.TEST_KEY12);
            list.add(ConstantsKeyEmv.TEST_KEY13);
            list.add(ConstantsKeyEmv.TEST_KEY14);
            list.add(ConstantsKeyEmv.TEST_KEY15);
            list.add(ConstantsKeyEmv.TEST_KEY16);
            list.add(ConstantsKeyEmv.TEST_KEY17);
            list.add(ConstantsKeyEmv.TEST_KEY18);
            list.add(ConstantsKeyEmv.TEST_KEY19);
            list.add(ConstantsKeyEmv.TEST_KEY20);
            list.add(ConstantsKeyEmv.TEST_KEY21);
            list.add(ConstantsKeyEmv.TEST_KEY22);
            list.add(ConstantsKeyEmv.TEST_KEY23);
            list.add(ConstantsKeyEmv.TEST_KEY24);
            list.add(ConstantsKeyEmv.TEST_KEY25);
            list.add(ConstantsKeyEmv.TEST_KEY26);
            list.add(ConstantsKeyEmv.TEST_KEY27);
            list.add(ConstantsKeyEmv.TEST_KEY28);
            list.add(ConstantsKeyEmv.TEST_KEY29);
            list.add(ConstantsKeyEmv.TEST_KEY30);
            list.add(ConstantsKeyEmv.TEST_KEY31);
            list.add(ConstantsKeyEmv.TEST_KEY32);
            list.add(ConstantsKeyEmv.TEST_KEY33);
            list.add(ConstantsKeyEmv.TEST_KEY34);
            list.add(ConstantsKeyEmv.TEST_KEY35);
            list.add(ConstantsKeyEmv.TEST_KEY36);
            list.add(ConstantsKeyEmv.TEST_KEY37);
            list.add(ConstantsKeyEmv.TEST_KEY38);

        }else{
           list.add(ConstantsKeyEmv.prod_k1);
        }

        return list;
    }

    public String updatefirmware(){
        return "";
    }
}
