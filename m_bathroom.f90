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

module m_bathroom 
    use m_status
    implicit none

    logical :: medicineCabinetOpen
    logical :: skeletonScare

    contains
    subroutine enterBathroom
        medicineCabinetOpen = .false.
        skeletonScare = .false.

        print *, "You have entered the bathroom."
        do 
            if (skeletonScare .eqv. .true.) then
                exit
            end if 

            call monsterAttack()
            
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway E) Examine mirror Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case ('e', 'E')
                call examineBathroomMirror()

            case ('q', 'Q')
                call quitProgram()

            case default
                print*, "Invalid selection, try again." 
    
            end select
        end do
    end subroutine enterBathroom

    subroutine examineBathroomMirror
        if (medicineCabinetOpen .eqv. .false.) then
            print *, "You open the bathroom mirror to look at the medicine cabinet behind it."
            print *, "The medicine cabinet is empty except for a first aid kit."
            print *, "The back of the medicine cabinet door has the numbers 5424 written on it. You wonder what that is about."
            foundSafeCombination = .true.
            medicineCabinetOpen = .true.
            call confirmUseFirstAidKit()
        else 
            print *, "Close medicine cabinet? Y/N"
            read(*, *, iostat=io_status) response
            if (response == 'y' .or. response == 'Y') then
                print *, "You close the medicine cabinet."
                print *, "The reflection you see now in the mirror where you should have seen  &
                &your reflection, you instead see a skeleton."
                print *, "You scream and run out to the hallway. "
                skeletonScare = .true.
                medicineCabinetOpen = .false.
            end if
        end if
    end subroutine examineBathroomMirror

    subroutine confirmUseFirstAidKit
        if (usedFirstAidKit .eqv. .false.) then
            print *, "Your current health is: ", health
            print *, "Do you want to use the first aid kit? Y/N"
            read(*, *, iostat=io_status) response
            if (response == 'y' .or. response == 'Y') then
                if (health > 80) then 
                    print *, "You can only use the first aid kit once. Are you sure you want to use the first ait kit now? Y/N"
                    read(*, *, iostat=io_status) response
                    if (response == 'y' .or. response == 'Y') then
                        call useTheFirstAidKit()
                    end if
                else 
                    call useTheFirstAidKit()
                end if 
            end if
        else 
            print *, "You notice that the first aid kit is empty."
        end if
    end subroutine confirmUseFirstAidKit

    subroutine useTheFirstAidKit
        health = health + 20
        if (health > 100) then 
            health = 100
        end if
        print *, "Your new current health is: ", health
        usedFirstAidKit = .true.
    end subroutine useTheFirstAidKit

end module m_bathroom