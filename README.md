# p_dialog

The purpose of the plugin is easy to use showing horizontal progress.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

  ## Circular progress usage
```
  PDialogEE dialog = PDialogEE(
    bgColor: Colors.pink,
    //on back button click
    cancelable: false,
    indicatorColor: Colors.lightBlue,
  );
  
  showPDialog(context: context, pDialogEE: dialog);
```
  ## Horizontal progress usage
```
  PDialogEE dialog = PDialogEE(
    bgColor: Colors.pink,
    //on back button click
    cancelable: false,
    design: LoadingProgressDesign.Horizontal,
    indicatorColor: Colors.lightBlue,
  );
  
  showPDialog(context: context, pDialogEE: dialog);
  ```
  
   ## Progress update
```   
   dialog.setDialogProgress(_start);
```   
   ## Progress dismiss
 ```  
   if (dialog.isShowing()) {
     dialog.onDismiss();
   }
```

