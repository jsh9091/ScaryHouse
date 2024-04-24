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

module m_basement 
    use m_status
    implicit none

    contains
    subroutine enterBasement 
        print *, "You have entered the basement."
        print *, "It is very dark. You hear a groaning sound, probably the house settling, right?"
        do 
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway E) Examine workbench Q) Quit"
            read(*, *, iostat=io_status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case ('e', 'E')
                call examineWorkbench()

            case ('q', 'Q')
                call quitProgram()

            case default
                print*, "Invalid selection, try again." 
    
            end select
    
        end do
    end subroutine enterBasement

    subroutine examineWorkbench

        if (foundAtticKey .eqv. .true.) then 
            print *, "The workbench is dusty and has nothing of interest on it."
            
        else 
            print *, "You examine the workbench table top and find a old dusty key."
            print *, "Pick up key? Y/N"
    
            read(*, *, iostat=io_status) response
    
            if (response == 'y' .or. response == 'Y') then
                foundAtticKey = .true.
            end if
        end if 
    end subroutine examineWorkbench

end module m_basement