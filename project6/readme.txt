This is how my algorithm works.

I reserved t0 - t2 to be the three temperary registers.

Whenever there is a need for a register, a function called FindRegister is
called. This function allocates as the following:

        * If there is already a register with the same address, return that
register.

        * If there is no register of that address, return an empty register
except temperary registers.

       * Otherwise, return a temperary register.

Once the register is found, it can be manipulated and used. If it is
manipulated, then is it marked as dirty, and thus it is required to write it to
memory at the end. Otherwise, it is ok to ignore it at the end.

I either spill one register (for contants), or three registers (the temp
registers, which is often done at the end of each function), or all registers
(for function calls for example).


