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

module m_attic 
    use m_status
    implicit none

    contains
    subroutine enterAttic 
        print *, "You have entered the attic."
        do 
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway L) Look around the attic Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case ('l', 'L') 
                call lookAroundAttic()

            case ('q', 'Q')
                call quitProgram()

            case default
                print*, "Invalid selection, try again." 
    
            end select
        end do
    end subroutine enterAttic

    subroutine lookAroundAttic
        print *, "You look around the attic, it is dark and dusty."
        print *, "You notice an old safe siting on the floor."
        print *, "Examine the safe? Y/N"
        read(*, *, iostat=io_status) response
        if (response == 'y' .or. response == 'Y') then
            call examineSafe()
        end if
    end subroutine lookAroundAttic

    subroutine examineSafe
        print *, "The safe has an old fashion combinaion lock."

        if (foundSafeCombination .eqv. .true.) then
            print *, "You try using the numbers you found behind the bathroom mirror as a combination."
            print *, "The safe opens."
            print *, "You can't belive what you are seeing inside the safe."
            print *, "You take the treasure out of the safe."
            print *, "Press the Enter key continue..."
            read (*, *)
            call startEndgame()
        else 
            print *, "You try a few random combinations, but can't get the safe open."
        end if
    end subroutine examineSafe

    subroutine startEndgame
        print *, "The attic ceiling collapses in front of the attic door. You cannot leave the way you came."
        print *, "Where the ceiling collapsed you can look out of what used to be the roof to see the night sky."
        print *, "You try looking to see if you can get out of the attic through the hole in the roof, but that is not an option."
        print *, "You are not sure how, but collapsed roof started a fire near where the door was."
        print *, "The fire is spreading and the attic is filling with smoke."
        print *, "You need to escape."
        call escapeAttic()
    end subroutine startEndgame

    subroutine escapeAttic
        do 
            call takeSmokeInjury() 

            ! display menu, and get user selection
            print *, "Make selection: L) Look around the attic I) Stand around looking at the fire like an idiot Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('i', 'I')
                print *, "The fire grows and the attic fills with smoke while you do nothing."

            case ('l', 'L') 
                print *, "There is a window at the far end of the attic."
                print *, "Go towards the window? Y/N"
                read(*, *, iostat=io_status) response
                if (response == 'y' .or. response == 'Y') then
                    call atticWindow()
                end if

            case ('q', 'Q')
                call quitProgram()

            case default
                print*, "Invalid selection, try again." 
    
            end select
        end do
    end subroutine escapeAttic

    subroutine takeSmokeInjury
        health = health - 1
        print *, "You breath in smoke. Health: ", health
    end subroutine takeSmokeInjury

    subroutine atticWindow
        print *, "You are standing at the window."
        do 
            call takeSmokeInjury() 

            ! display menu, and get user selection
            print *, "Make selection: L) Look around the attic O) Try to open the window Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('o', 'O')
                print *, "The window opens up."
                !print *, "Press Enter key to craw through window..."
                !read(*, *)
                call crawlOnToRoof()

            case ('l', 'L') 
                print *, "There does not appear to be any other options for escape."

            case ('q', 'Q')
                call quitProgram()

            case default
                print*, "Invalid selection, try again." 
    
            end select
        end do
    end subroutine atticWindow

    subroutine crawlOnToRoof
        print *, "You are now outside the house on the roof."
        print *, "The fire has grown to where you were just standing. There's no going back."
        print *, "You craw on to the roof to the lowest point to the ground you can."
        print *, "There is a tree branch about halfway between you and the ground."
        print *, "Press Enter key to jump to the branch..."
        read (*, *)
        call theEnd()

    end subroutine crawlOnToRoof

    subroutine theEnd
        print *, "You jump to and grab the branch, but the branch is weak and only holds you up for a few seconds before it breaks."
        print *, "You fall several feet to the ground."
        health = health - 10
        print *, "You get hurt as you land on to the ground. Health: ", health

        if (health > 0) then 
            print *, "You are hurt a little from your fall, but you have escaped the house."
            print *, "You walk off into the night."
            print *, "You look at the treasure you got from the safe and smile."
        else
            print *, "Your injuries were too great, better luck next time."
        end if

        print *, "THE END."
        stop
    end subroutine theEnd

end module m_attic