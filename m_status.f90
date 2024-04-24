 ! MIT License
 ! 
 ! Copyright (c) 2024 Joshua Horvath
 ! 
 ! Permission is hereby granted, free of charge, to any person obtaining a copy
 ! of this software and associated documentation files (the "Software"), to deal
 ! in the Software without restriction, including without limitation the rights
 ! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 ! copies of the Software, and to permit persons to whom the Software is
 ! furnished to do so, subject to the following conditions:
 ! 
 ! The above copyright notice and this permission notice shall be included in all
 ! copies or substantial portions of the Software.
 ! 
 ! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 ! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 ! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 ! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 ! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 ! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 ! SOFTWARE.

module m_status
    implicit none

    character(len=1) :: response
    integer :: io_status
    
    integer :: health
    logical :: foundAtticKey
    logical :: foundBaseballBat
    logical :: foundSafeCombination

    contains
    subroutine printStatus
        print *, "Health: ", health
        print *, "Found Attic Key: ", foundAtticKey
        print *, "Found Baseball Bat: ", foundBaseballBat
        print *, "Found combination for safe: ", foundSafeCombination
    end subroutine printStatus

    subroutine quitProgram
        print *, "Are you sure you want to quit the game? Y/N"
        read(*, *) response
        if (response == 'y' .or. response == 'Y') then
            print *, "You have choosen to leave the house. &
                &That's probably the safest thing to do anyway. Goodbye."
            stop ! shut down the program
        end if
    end subroutine quitProgram
end module m_status