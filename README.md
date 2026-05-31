# learn-terraform
How to fix the space issues on the lab AMI ?
Our LAB AMI uses xfs fileSystem

Expanding the disk, is not going to let the fileSystem take it directly. 
How to fix the space issue:

1) On LAB AMI, if you see that you ran out of space, you can expand the disk first ( But stll it won't be showing up on the system )
2) But if still you cannot access it as we are using LVM and you've to deligate that to the needed partion.
3) And the commands varies based on the fileSystem that the system uses, ( ext4, jfs, xfs ) and we use xfs. 
    1) Add the disk ( On UI ) 
    2) Expand the disk : sudo growpart /dev/nvme0n1 4          ( 4 is the partition number ) ; expands the partition
    3) sudo lvextend -l +50%FREE /dev/mapper/RootVG-homeVol ;  ( Extends LVM )
    4) sudo lvextend -l +100%FREE /dev/mapper/RootVG-varVol ; ( Extends LVM )
    5) sudo xfs_growfs  /var ; sudo xfs_growfs  /home ;        ( Expand the fileSystem ) 
    6) df -h
If you're using Jenkins

sudo lvextend -l +50%FREE /dev/mapper/RootVG-homeVol ; sudo lvextend -l +1000%FREE /dev/mapper/RootVG-varVol ; sudo xfs_growfs /var ; sudo xfs_growfs /home

Run this : sudo mount -o remount,size=2G /tmp ( This temporary ), place it in the bash_profile