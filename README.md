# OpenSCAD-Enclosure
A script for the OpenSCAD software package, that creates  enclosures for electronic projects like this:
<img src=https://github.com/astromikemerri/OpenSCAD-Enclosure/blob/main/SampleBox.JPG width=400 align=left>>

These rectangular boixes have removable lids and bases.  As well as being able to specify the interior dimensions of the box and other parameters like the wall thickness, the user can also specify rectangular and circular apertures in any of the walls of the box.

To get it to work, <A href=https://openscad.org/downloads.html>Install OpenSCAD</a>, edit <a href=https://github.com/astromikemerri/OpenSCAD-Enclosure/blob/main/Enclosure.scad>the script</a> to specify the size you want and the apertures you require.  The script should be fairly self-explanatory, with the sample apertures in the example given.  Dimensions are all in millimetres. Just edit the dimensions near the start and the modules base(), lid() and walls() to specify the size and position of any apertures.  Open the file in OpenSCAD, preview it (F5 key) and, when it looks the way you want, render it (F6 key). You can then export it (File>Export) as <A href=https://github.com/astromikemerri/OpenSCAD-Enclosure/blob/main/enclosure.stl>an STL file</a>, or whatever other format your 3D printer supports.  
