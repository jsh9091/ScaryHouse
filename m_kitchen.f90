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

module m_kitchen 
    use m_status
    implicit none
    logical :: lookedOutWindow

    contains
    subroutine enterKitchen
        lookedOutWindow = .false.
        print *, "You have entered the kitchen."
        do 
            if (lookedOutWindow .eqv. .true.) then 
                exit
            end if

            call monsterAttack()
            
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway E) Examine kitchen counter &
            &L) Look in fridge W) Look out the window Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case ('e', 'E')
                call examineCounter()

            case ('l', 'L')
                call lookInRefrigerator()

            case ('w', 'W')
                call lookOutWindow()

            case ('q', 'Q')
                call quitProgram()

            case default
                print*, "Invalid selection, try again." 
    
            end select
    
        end do
    end subroutine enterKitchen

    subroutine examineCounter
        print *, "The kitchen counter contains an old photograph of a woman."
        print *, "The eyes of the woman seem to follow you and give you the creeps."
        print *, "For some reason you want to be anywhere else."
    end subroutine examineCounter

    subroutine lookInRefrigerator
        print *, "You walk up to an old refrigerator and open the door."
        print *, "There is no power in the house, so it is no surprise that no light turns on."
        print *, "It does not look like there is any food, but there is a terrible smell."
        print *, "You hear a sqeaking sound, and then realize there is a rat in the fridge."
        print *, "You slam the door shut and walk away from the refrigerator."
    end subroutine lookInRefrigerator

    subroutine lookOutWindow
        print *, "You walk over to the window and look outside."
        print *, "It looks like something is moving outside, but you are not sure."
        print *, "There is a flash of lightning."
        print *, "As the flash happens, instead of seeing your own reflection in the glass, you see someone else's face."
        print *, "You run out of the room."
        lookedOutWindow = .true.
    end subroutine lookOutWindow
end module m_kitchen