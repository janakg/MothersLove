package com.motherslove;

import android.content.Context;
import android.widget.Toast;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.motherslove.HelloWorld;

/**
 * Created by kensteiner on 02.01.18.
 */

public class HelloWorldModule extends ReactContextBaseJavaModule {

    Context mContext;
    private HelloWorld cppApi;

    static {
        System.loadLibrary("helloworld");
    }


    public HelloWorldModule(ReactApplicationContext reactContext) {
        super(reactContext);
        mContext = reactContext;

        cppApi = HelloWorld.create();
    }

    @Override
    public String getName() {
        return "HelloWorld";
    }

    @ReactMethod
    public void sayHello(Callback successCallback) {
        try {
            String message = cppApi.getHelloWorld();
            successCallback.invoke(message);
        } catch (Exception e) {
            Toast.makeText(mContext, "Unable to fetch shared preference", Toast.LENGTH_LONG).show();
        }
    }

    @ReactMethod
    public void add(int a, int b, Promise promise) {
        try {
            int sum = cppApi.add(a, b);
            promise.resolve(sum);
        } catch (Exception e) {
            Toast.makeText(mContext, "Unable to fetch shared preference", Toast.LENGTH_LONG).show();
        }
    }


}
