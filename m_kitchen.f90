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
    integer :: k_status
    character(len=1) :: k_response

    contains
    subroutine  enterKitchen
        print *, "You have entered the kitchen."
        do 
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway"
            read(*, *, iostat=k_status) k_response

            select case (k_response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case default
                print*, "Invalid selection, try again." 
    
            end select
    
        end do
    end subroutine enterKitchen

end module m_kitchen