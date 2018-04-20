#imaging-script
scripts to deploy windows images

you'll need the disk number of the hard drive you're trying to place the image on.
to get this, use the diskpart utility.

at the winpe command line, type
`diskpart`
`list disk`

then, change directories to the USB drive containing imagex, the image, and scripts.
to get the path of the USB drive, use the diskpart utility.

at the winpe command line, type
`diskpart`
`list volume`

the USB drive will have a size of around 60gb.

then change directories to the drive.
to do this, use the winpe command line.
if the drive is at F:, simply type F:.

then, type `deploy` to run the script.

