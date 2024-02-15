# music_app Mohammad Darwish

A new Flutter project.

You can check the UI images to see how the app looks like

If you face an issue running the app from this error [ ERROR:D8: Cannot fit requested classes in a single dex file (# methods: 67905 > 65536) ] --> steps to solve it

1) Open your android/app/build.gradle file.

2) Inside the android block, add the following lines to enable Multidex:
   
   android {
    ...
    defaultConfig {
        ...
        multiDexEnabled true
    }
}

3) Add the Multidex dependency to your dependencies block:

   dependencies {
    ...
    implementation 'com.android.support:multidex:1.0.3'
}

4) Save changes and run the app again :) 
