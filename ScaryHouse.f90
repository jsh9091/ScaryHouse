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
    ! import code from modules
    use m_bedroom, only: enterBedroom 
    use m_kitchen, only: enterKitchen 
    use m_bathroom, only: enterBathroom 
    use m_basement, only: enterBasement 
    use m_attic, only: enterAttic 
    use m_status

    ! very important, do not allow typing of variables based off variable name
    implicit none

    ! initialize status state values
    health = 100
    foundAtticKey = .false.
    foundBaseballBat = .false.
    foundSafeCombination = .false.
 
    ! introduction text 
    print *, "You are standing outside a scary old, abandoned house. "
    print *, "They say something bad happened in that house. They say the house is haunted, but that can’t be true, can it? "

    call frontPorchMenu()

    ! if user selected enter halway in porch menu subroutine
    if (response == 'h' .or. response == 'H') then
        call hallwayMenu()
    end if

    contains
    ! menu presented only at begining of game
    subroutine frontPorchMenu
        do 
            print *, "H) Enter the house. Q) Quit the game."
            read(*, *, iostat=io_status) response
    
            select case (response)

            case ('s', 'S') 
                call printStatus()

            case ('h', 'H') 
                print *, "Entering the house."
                exit

            case ('q', 'Q')
                call quitProgram()
    
            case default
                print*, "Invalid selection, try again." 
            end select
        end do
    end subroutine frontPorchMenu

    ! main central menu of bulk of game
    subroutine hallwayMenu
        
        do
            call monsterAttack()
             
            print *, "You are in the main hallway."
            ! display menu 
            print *, "Make selection: B) Go to bedroom K) Go to kitchen A) Go to bathroom E) Go to end of hallway Q) Quit game"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('b', 'B')
                call enterBedroom()

            case ('a', 'A')
                call enterBathroom()

            case ('k', 'K')
                call enterKitchen()

            case ('e', 'E')
                call endOfHallway()

            case ('q', 'Q')
                call quitProgram()
    
            case default
                print*, "Invalid selection, try again." 
            end select
        end do
    end subroutine hallwayMenu

    ! menu for entering basement and attic locations 
    subroutine endOfHallway
        print *, "You have moved to the far end of the hallway."
        do 
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to main part of hallway A) Explore attic B) Explore basement"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case ('a', 'A')
                if (foundAtticKey .eqv. .true.) then 
                    print *, "The attic door is opens up."
                    call enterAttic()
                else 
                    print *, "The attic door is locked."
                end if 

            case ('b', 'B')
                print *, "The basement door is jammed and only opens slightly. There is a strange sound behind the door."

                if (foundBaseballBat .eqv. .true.) then 
                    print *, "You try using the baseball bat as a crowbar to open the door."
                    print *, "The door opens, and you step into the basement."
                    call enterBasement()
                end if

            case default
                print*, "Invalid selection, try again." 
            end select
        end do
    end subroutine endOfHallway
end program ScaryHouse