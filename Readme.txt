Read plates, easily.

== import_plate(directory) ==

To import a plate, run 'import_plate'. If given a directory name
as an argument, it will import a plate from that directory. If
no arguments are given, it opens a directory selection dialog.

The function returns a 3-dimensional array.

The wells (1-96) are arranged along the first (vertical) dimension.
The scans are arranged along the second (horizontal) dimension.
The readings (GFP, RFP, etc) are arranged along the third (depth) dimension.

For example,

First scan:
gfp	OD 600nm	rfp	Well positions 	Strip method names
6379	0.0527	38	A1	DO600nm_39
6334	0.0526	35	A2	DO600nm_39
6202	0.0528	37	A3	DO600nm_39
6173	0.0527	39	A4	DO600nm_39
[...]

Second scan:

gfp	OD 600nm	rfp	Well positions 	Strip method names
4774	0.0524	36	A1	DO600nm_39
4740	0.0524	36	A2	DO600nm_39
4658	0.0528	34	A3	DO600nm_39
4643	0.0526	35	A4	DO600nm_39
[...]

data = import_plate('Robotest/Plate1');

To get the value of the second gfp scan for well 3 (A3):

> data(3, 2, 1)
ans =
        4658

To get all OD scans for well 3:
data(3,:,2)
ans =
    0.0528    0.0528    0.0530    0.0536    0.0549    0.0580    0.0609    0.0679    0.0799    0.0959    0.1198    0.1422

To plot all rfp scans for well 3:
plot(data(3, :, 3))

== pos2ind ==

If you find yourself confused with the well numbers, use pos2ind():

To get the number of well H3:

> pos2ind('H', 3)
ans =
    59

All gfp scans for well H3:

> data(pos2ind('H', 3), :, 1)
ans =
        6471        4690        4283        4768        4388        4480        5105        5056        5903        6204        7295        8104


Enjoy!

