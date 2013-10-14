rm -f tags
ctags -aR lib_arm/ drivers/ common/ net/ include/*.h   cpu/arm_cortexa8/start.S
#ctags -aR cpu/arm_cortexa8/pnx84xx/ include/asm-arm/arch-pnx84xx/ include/configs/vpe_apollo.h board/nxp

ctags -aR board/allwinner/a10-evb
ctags -aR arch/arm/cpu/armv7/sunxi
ctags -aR include/configs/sun4i.h
ctags -aR arch/arm/include
ctags -aR arch/arm/lib
