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

program ScaryHouse
    use m_bedroom, only: enterBedroom 
    use m_kitchen, only: enterKitchen 
    use m_bathroom, only: enterBathroom 
    use m_status
    implicit none
    character(len=1) :: response
    integer :: status

    ! initialize status state values
    health = 100

    ! introduction text 
    print *, "You are standing outside a scary old, abandoned house. "
    print *, "They say there was a murder in that house. They say the house is haunted, but that can’t be true, can it? "

    call frontPorchMenu()

    if (response == 'h' .or. response == 'H') then
        call hallwayMenu()
    end if

    contains
    subroutine frontPorchMenu
        do 
            print *, "H) Enter the house. Q) Quit the game."
            read(*, *, iostat=status) response
    
            select case (response)
            case ('s', 'S') 
                call printStatus()
            case ('h', 'H') 
                print *, "Entering the house."
                exit
            case ('q', 'Q')
                print *, "Giving up and going home is probably the safer thing to do anyway."
                exit
    
            case default
                print*, "Invalid selection, try again." 
            end select
        end do
    end subroutine frontPorchMenu

    subroutine hallwayMenu
        do
            ! display menu 
            print *, "Make selection: B) Go to bedroom, K) Go to kitchen A) Go to bathroom Q) Quit game"
            read(*, *, iostat=status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('b', 'B')
                print *, "Entering bedroom."
                call enterBedroom()

            case ('a', 'A')
                print *, "Entering bathroom."
                call enterBathroom()

            case ('k', 'K')
                print *, "Entering Kitchen."
                call enterKitchen()

            case ('q', 'Q')
                print *, "Are you sure you want to quit the game? Y/N"
                read(*, *, iostat=status) response
                if (response == 'y' .or. response == 'Y') then
                    print *, "You have choosen to leave the house. &
                        &That's probably the safest thing to do anyway. Goodbye."
                    exit
                end if
    
            case default
                print*, "Invalid selection, try again." 
            end select
        end do
    end subroutine hallwayMenu
end program ScaryHouse