module m_bedroom
    use m_status
    implicit none
    integer :: b_status
    character(len=1) :: b_response


    contains
    subroutine  enterBedroom
        print *, "You have entered a bedroom."

        do 
            ! display menu, and get user selection
            print *, "Make selection: H) Go back to hallway"
            read(*, *, iostat=b_status) b_response

            select case (b_response)
            case ('s', 'S') 
                call printStatus()

            case ('h', 'H')
                print *, "Returning to hallway."
                exit

            case default
                print*, "Invalid selection, try again." 
    
            end select
    
        end do
    end subroutine enterBedroom

end module m_bedroom