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

module m_bedroom
    use m_status
    implicit none
    logical :: lookedIntoMirror

    contains
    subroutine  enterBedroom
        lookedIntoMirror = .false.

        print *, "You have entered a bedroom."

        do 
            call monsterAttack()
            
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway E) Examine nightstand L) Look into mirror Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case ('e', 'E') 
                call examineNightstand()

            case ('l', 'L') 
                call lookIntoMirror()

            case ('q', 'Q')
                call quitProgram()
 
            case default
                print*, "Invalid selection, try again." 
    
            end select
    
        end do
    end subroutine enterBedroom

    subroutine  examineNightstand
        print *, "You examine the nightstand next to the bed."

        if (foundBaseballBat .eqv. .true.) then 
            print *, "The nightstand is dusty and has nothing of interest on it."
            
        else 
            print *, "You notice a baseball bat propped up on the nightstand behind the bed."
            print *, "Pick up baseball bat? Y/N"
    
            read(*, *, iostat=io_status) response
    
            if (response == 'y' .or. response == 'Y') then
                foundBaseballBat = .true.
            end if
        end if 
    end subroutine examineNightstand

    subroutine lookIntoMirror
        print *, "You look into the mirror."

        if (lookedIntoMirror .eqv. .false.) then
            print *, "The mirror is dirty and you wipe your hand across it to clean it a little."
            print *, "As your hand brushes across the mirror, you see your reflection and someone standing behind you."
            print *, "You turn around but no one is there."
            lookedIntoMirror = .true.
        else 
            print *, "You just see yourself."
        end if 
    end subroutine lookIntoMirror

end module m_bedroom