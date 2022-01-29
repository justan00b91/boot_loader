# boot_loader
Simple boot loader in asm that uses legacy boot

## Usage:
  ```bash
  $> git clone https://github.com/justan00b91/boot_loader.git
  $> cd boot_loader
  $> make -f Makefile
  ```
  The above code create ```main_floppy.img``` file which is standard floppy image file of 1440k
  
  Install qemu to run the image file in virtual environment.
  
  ```bash
  $> make -f Makefile run
  ```
