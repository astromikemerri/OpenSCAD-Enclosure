# OpenSCAD-Enclosure

<img src=https://github.com/astromikemerri/OpenSCAD-Enclosure/blob/main/SampleBox.JPG width=200 align=left>
A script for the OpenSCAD software package, that creates  enclosures for electronic projects.

These rectangular boxes have removable lids and bases for ease of access.  As well as being able to define the interior dimensions of the box and other parameters like the wall thickness, the user can also specify rectangular and circular apertures in any of the walls of the box.

To produce an enclosure, <A href=https://openscad.org/downloads.html>Install OpenSCAD</a>, edit <a href=https://github.com/astromikemerri/OpenSCAD-Enclosure/blob/main/Enclosure.scad>the script</a> to specify the size you want and the apertures you require.  The script should be fairly self-explanatory, based on the sample apertures in the example given.  Sizes are all in millimetres. Just edit the dimensions of the box near the start of the script, and entries in the modules base(), lid() and walls() to specify the size and position of any apertures.  Open the file in OpenSCAD, preview it (F5 key) and, when it looks the way you want, render it (F6 key). You can then export it (File>Export) as <A href=https://github.com/astromikemerri/OpenSCAD-Enclosure/blob/main/enclosure.stl>an STL file</a>, or whatever other format your 3D printer supports.  
