program ScaryHouse
    use m_bedroom, only: enterBedroom 
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
            print *, "Make selection: B) Go to bedroom, Q) Quit game"
            read(*, *, iostat=status) response

            select case (response)
            case ('s', 'S') 
                call printStatus()

            case ('b', 'B')
                print *, "Entering bedroom."
                call enterBedroom()

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