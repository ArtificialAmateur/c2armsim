@
@ Author: Frank Tursi
@
        .equ SWI_Exit,           0x11
        .equ SWI_Open,           0x66
        .equ SWI_Close,          0x68
        .equ SWI_PrStr,          0x69
        .equ SWI_RdStr,          0x6a

        .text
        .global _write
_write:
	swi SWI_PrStr
	mov pc,lr

        .global _read
_read:
	swi SWI_RdStr
	mov pc,lr

        .global _open
_open:
	swi SWI_Open
	mov pc,lr

        .global _halt
_halt:
	swi SWI_Exit
	mov pc,lr

        .global _close
_close:
	swi SWI_Close
	mov pc,lr
