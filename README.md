#Description
This is the [Nuget package](https://www.nuget.org/packages/DragAndDropMultiSelectorList/) source code of the control used in this web project [Asp.Net MVC project of DragAndDropMultiSelectorWebSite](https://github.com/MrDesjardins/DragAndDropWebList).

It allows to drag and drop from a list of possible values (called available choice) to a list of selected choice. This replace the old basic two list with buttons that allow to move from one side to the other values.

![Animated gif that demonstrate the user control](https://raw.github.com/MrDesjardins/DragAndDropWebList/master/MultiChoice.gif "Demo")

#How to use it
1. Download the Nuget package
2. Add the CSS and Javascript file to your .cshtml
3. Use the UIHint and the ViewModel class into your ViewModel


    
        [UIHint("MultiSelectorExtended")]
        public MultiSelectorWithSingleValueExtended YourProperty { get; set; }
 
    
4. Inside your controller, do not forget to add possible value to the ViewModel property (For example: YourProperty)

#Links
* [Example](https://github.com/MrDesjardins/DragAndDropWebList) of how to use it
* [Nuget package](https://www.nuget.org/packages/DragAndDropMultiSelectorList/)
